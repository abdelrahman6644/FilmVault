import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/Services/Trending.dart';
import 'package:movies_app/Widgets/message_error.dart';
import 'package:movies_app/Widgets/popular_movies.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TrendingRow extends StatefulWidget {
  const TrendingRow({super.key});

  @override
  State<TrendingRow> createState() => _TrendingRowState();
}

class _TrendingRowState extends State<TrendingRow> {
  // ignore: prefer_typing_uninitialized_variables
  var future;

  @override
  void initState() {
    super.initState();
    future = TrendingServices(Dio()).getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
        future: future,
        builder: (context, snapshot) {
          HandlingError screen = HandlingError(snapshot: snapshot);
          return screen.ReturnRow();
        });
  }
}

class HandlingError {
  var snapshot;
  HandlingError({required this.snapshot});

  Widget ReturnRow() {
    if (snapshot.hasData) {
      return snapshotHasData(); // Return widget
    } else if (snapshot.hasError) {
      return snapshotHasError(); // Return widget
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return snapshotConnectionWaiting(); // Return widget
    } else if (snapshot.connectionState == ConnectionState.none) {
      return snapshotNoConnection(); // Return widget
    } else {
      return UnhandlingError(); // Return widget
    }
  }

  Widget snapshotHasData() {
    List<MovieModel> trendingMovies = [];
    for (var movie in snapshot.data!) {
      if (movie.poster != null) {
        trendingMovies.add(movie);
      }
    }
    if (trendingMovies.isNotEmpty) {
      return PopularMovies(
        movies: trendingMovies,
      );
    } else {
      return const Skeletonizer(
        enabled: true,
        child: PopularMovies(
          movies: [],
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
    return const Skeletonizer(
      enabled: true,
      child: PopularMovies(
        movies: [],
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
