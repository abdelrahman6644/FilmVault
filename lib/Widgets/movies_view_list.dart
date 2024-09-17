import 'package:flutter/material.dart';
import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/Widgets/movie_card.dart';
import 'package:movies_app/Widgets/MoviePageParts/movie_view_builder.dart';
import 'package:movies_app/views/movie_page.dart';

class MoviesList extends StatefulWidget {
  MoviesList({super.key});
  MovieModel movie = MovieModel(poster: '', id: 0);

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MovieView(
                  id: widget.movie.id!,
                )),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) => MovieCard(),
      ),
    );
  }
}
