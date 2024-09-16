import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Services/APIs/upcoming_api.dart';
import 'package:movies_app/Widgets/handling_error.dart';

class UpcomingRow extends StatefulWidget {
  const UpcomingRow({super.key});

  @override
  State<UpcomingRow> createState() => _UpcomingRowState();
}

class _UpcomingRowState extends State<UpcomingRow> {
  var future;
  @override
  void initState() {
    super.initState();
    future = UpcomingApi(Dio()).getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          HandlingError screen = HandlingError(snapshot: snapshot);
          return screen.ReturnRow();
        });
  }
}
