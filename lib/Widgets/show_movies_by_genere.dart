import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/DataBase/generes_types.dart';
import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/Services/APIs/upcoming_api.dart';
import 'package:movies_app/Widgets/genere.dart';
import 'package:movies_app/Widgets/message_error.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';
import 'package:movies_app/constants.dart';

// ignore: must_be_immutable
class ShowMoviesByGenere extends StatefulWidget {
  ShowMoviesByGenere({
    super.key,
    this.currentGenere = 0,
  });
  int currentGenere;
  String type = genres[0]["name_in_api"];

  @override
  State<ShowMoviesByGenere> createState() => _ShowMoviesByGenereState();
}

class _ShowMoviesByGenereState extends State<ShowMoviesByGenere> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8),
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genres.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    widget.currentGenere = index;
                    widget.type = genres[index]["name_in_api"];
                  });
                },
                child: Genere(
                  index: index,
                  isActive: widget.currentGenere == index,
                )),
          ),
        ),
        GenereBuilder(
          widget: widget,
          type: widget.type,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class GenereBuilder extends StatefulWidget {
  GenereBuilder({
    super.key,
    required this.widget,
    required this.type,
  });
  final String type;
  final ShowMoviesByGenere widget;
  // ignore: prefer_typing_uninitialized_variables
  var future;
  @override
  State<GenereBuilder> createState() => _GenereBuilderState();
}

class _GenereBuilderState extends State<GenereBuilder> {
  @override
  Widget build(BuildContext context) {
    widget.future = UpcomingApi(Dio(), type: widget.type).getUpcomingMovies();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: FutureBuilder<List<MovieModel>>(
          future: widget.future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGrid(),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ShowPoster(
                    Imageurl: posterUrl + (snapshot.data?[index].poster ?? ""),
                    height: 200,
                    width: 110,
                    movieID: snapshot.data![index].id??0,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const MessageError(
                Message: 'There Was an Error Please try Later',
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.none) {
              return const MessageError(
                Message: 'The Internet Lost',
              );
            } else {
              return const MessageError(
                Message: 'There Was an Error Please try Later',
              );
            }
          }),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount SliverGrid() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 0.7,
      mainAxisSpacing: 0,
      crossAxisSpacing: 16,
    );
  }
}
