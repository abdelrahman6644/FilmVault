import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Models/movies_model.dart';
import 'package:movies_app/Widgets/message_error.dart';
import 'package:movies_app/Widgets/view_row.dart';

class HandlingError {
  var snapshot;
  HandlingError({required this.snapshot});

  Widget ReturnRow() {
    if (snapshot.hasData) {
      return snapshotHasData();
    } else if (snapshot.hasError) {
      return snapshotHasError();
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return snapshotConnectionWaiting();
    } else if (snapshot.connectionState == ConnectionState.none) {
      return snapshotNoConnection();
    } else {
      return UnhandlingError();
    }
  }

  Widget snapshotHasData() {
    List<FullMovieModel> Movies = [];
    // return snapshotConnectionWaiting();
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
      return snapshotConnectionWaiting();
    }
  }

  Widget snapshotHasError() {
    return const MessageError(
      Message: 'There Was an Error Please try Later',
    );
  }

  Widget snapshotConnectionWaiting() {
    return SizedBox(
      height: 214.h,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
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
