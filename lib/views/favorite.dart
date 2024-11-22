import 'package:flutter/material.dart';
import 'package:movies_app/Widgets/MoviePageParts/movie_view_builder.dart';
import 'package:movies_app/Widgets/movie_card.dart';
import 'package:movies_app/constants.dart';

class FavoriteMovies extends StatelessWidget {
  const FavoriteMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: FavMovies.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieView(
                      id: FavMovies[index].id,
                    )),
          ),
          child: MovieCard(
            movie: FavMovies[index],
          ),
        ),
      ),
    );
  }
}
