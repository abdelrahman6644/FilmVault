import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Services/APIs/search_api.dart';
import 'package:movies_app/Widgets/message_error.dart';
import 'package:movies_app/Widgets/movie_card.dart';
import 'package:movies_app/Widgets/MoviePageParts/movie_view_builder.dart';

class MoviesList extends StatefulWidget {
  MoviesList({super.key, required this.movieName});
  String movieName;
  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  var future;
  @override
  Widget build(BuildContext context) {
    future = SearchService(Dio()).getSearchMovie(widget.movieName);
    return FutureBuilder<List<FullMovieModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieView(
                          id: snapshot.data![index].id,
                        )),
              ),
              child: MovieCard(
                movie: snapshot.data![index],
              ),
            ),
          );
        } else {
          print(snapshot.data);
          return const MessageError(Message: "There was error");
        }
      },
    );
  }
}
