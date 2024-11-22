import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Models/movies_model.dart';
import 'package:movies_app/Services/APIs/trending_api.dart';
import 'package:movies_app/Widgets/handling_error.dart';

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
    future = TrendingApi(Dio()).getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FullMovieModel>>(
        future: future,
        builder: (context, snapshot) {
          HandlingError screen = HandlingError(snapshot: snapshot);
          return screen.ReturnRow();
        });
  }
}
