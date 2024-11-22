import 'package:flutter/material.dart';
import 'package:movies_app/Models/full_movie_model.dart';

class SearchProvider extends ChangeNotifier {
  List<FullMovieModel>? _SearchData;
  String? MovieName;
  set SearchData(List<FullMovieModel>? Movie) {
    _SearchData = Movie;
  }

  List<FullMovieModel>? get SearchData => _SearchData;
}
