import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Providers/search_provider.dart';
import 'package:movies_app/Services/APIs/search_api.dart';
import 'package:movies_app/Widgets/MoviePageParts/movie_view_builder.dart';
import 'package:movies_app/Widgets/customTextField.dart';
import 'package:movies_app/Widgets/custom_floating_action_buttom.dart';
import 'package:movies_app/Widgets/message_error.dart';
import 'package:movies_app/Widgets/movie_card.dart';
import 'package:movies_app/constants.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key, required this.movieName});
  String movieName;
  var future;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(context) {
    widget.future = SearchService(Dio()).getSearchMovie(widget.movieName);
    setState(() {
      widget.movieName;
    });
    return Scaffold(
      floatingActionButton: CustomFloatingActionButtom(
        scrollController: scrollController,
      ),
      // backgroundColor: const Color(primaryColor),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.cyan,
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            textField(
              hint: 'Search',
              onChanged: (String name) {},
              icon: Icons.search,
              onFieldSubmitted: (String text) async {
                if (text != "") {
                  widget.movieName = text;
                  SearchService search = SearchService(Dio());
                  List<FullMovieModel> Movie =
                      await search.getSearchMovie(widget.movieName);
                  Provider.of<SearchProvider>(context, listen: false)
                      .SearchData = Movie;
                  Provider.of<SearchProvider>(context, listen: false)
                      .MovieName = widget.movieName;

                  setState(() {});
                }
              },
            ),
            FutureBuilder<List<FullMovieModel>>(
              future: widget.future,
              builder: (context, snapshot) {
                return ResultSearch(snapshot);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget ResultSearch(AsyncSnapshot<List<FullMovieModel>> snapshot) {
    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ListView.builder(
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
        ),
      );
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return SizedBox(
        height: 214.h,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: CircularProgressIndicator()),
          ],
        ),
      );
    } else if (snapshot.connectionState == ConnectionState.none) {
      return const MessageError(
        Message: 'The Internet Lost.',
      );
    } else {
      print(snapshot.data);
      return const MessageError(
          Message: "There was error, Please Try again Later.");
    }
  }
}
