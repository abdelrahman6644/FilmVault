import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Services/APIs/movie_detailes_api.dart';
import 'package:movies_app/Widgets/message_error.dart';
import 'package:movies_app/Widgets/popular_movies.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/views/movie_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieView extends StatefulWidget {
  MovieView({super.key, required this.id});
  int id;
  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  var future;
  @override
  void initState() {
    super.initState();
    future = MovieApi(Dio()).getMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          HandlingError screen = HandlingError(snapshot: snapshot);
          return screen.ReturnMovie();
        });
  }
}

class HandlingError {
  var snapshot;

  HandlingError({required this.snapshot});

  Widget ReturnMovie() {
    if (snapshot.hasData) {
      return snapshotHasData(); // Return widget
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return snapshotConnectionWaiting(); // Return widget
    } else if (snapshot.connectionState == ConnectionState.none) {
      return snapshotNoConnection(); // Return widget
    } else {
      return UnhandlingError(); // Return widget
    }
  }

  Widget snapshotHasData() {
    if (snapshot.data != null) {
      FullMovieModel Movie;
      Movie = snapshot.data;
      return MoviePage(
        movie: Movie,
      );
    } else {
      return Skeletonizer(
        enabled: true,
        child: MoviePage(
          movie: DefaultMod,
        ),
      );
    }
  }

  Widget snapshotHasError() {
    return const MessageError(
      Message: 'There Was an Error Please try Later',
    );
  }

  Widget snapshotConnectionWaiting() {
    return Skeletonizer(
      enabled: true,
      child: MoviePage(
        movie: DefaultMod,
      ),
    );
  }

  Widget snapshotNoConnection() {
    return const MessageError(
      Message: 'The Internet Lost',
    );
  }

  Widget UnhandlingError() {
    return const MessageError(
      Message: 'There Was an Error Please try Later',
    );
  }
}
