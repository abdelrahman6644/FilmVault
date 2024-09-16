import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/Services/Trending.dart';
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
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    future = TrendingServices(Dio()).getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: FutureBuilder<List<MovieModel>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              isLoading = true;
              setState(() {});
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              // ignore: avoid_print
              print('Error: ${snapshot.error}');
              return const Center(
                  child: Text(
                'There Was an Error Please try Later',
                style: TextStyle(
                  fontSize: 25,
                ),
              ));
            }

            List<MovieModel> trendingMovies = [];
            for (var movie in snapshot.data!) {
              if (movie.poster != null) {
                trendingMovies.add(movie);
              }
            }

            if (!snapshot.hasData ||
                snapshot.data == null ||
                trendingMovies.isEmpty) {
              return Container(
                height: 200,
                child: const Text(
                  'No Data Available',
                  style: TextStyle(color: Colors.yellow, fontSize: 25),
                ),
              );
            }
            isLoading = false;

            // setState(() {});
            return PopularMovies(
              movies: trendingMovies,
            );
          }),
    );
  }
}