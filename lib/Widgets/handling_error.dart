import 'package:flutter/material.dart';
import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/Widgets/message_error.dart';
import 'package:movies_app/Widgets/popular_movies.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    List<MovieModel> Movies = [];
    for (var movie in snapshot.data!) {
      if (movie.poster is String) {
        Movies.add(movie);
      }
    }
    if (Movies.isNotEmpty) {
      return ViewInRow(
        movies: Movies,
      );
    } else {
      return const Skeletonizer(
        enabled: true,
        child: ViewInRow(
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
      child: ViewInRow(
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
