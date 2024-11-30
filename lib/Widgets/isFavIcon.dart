import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/Models/full_movie_model.dart';

class IsFavIcon extends StatefulWidget {
  const IsFavIcon({super.key, required this.movie});
  final FullMovieModel movie;

  @override
  State<IsFavIcon> createState() => _IsFavIconState();
}

class _IsFavIconState extends State<IsFavIcon> {
  Box<FullMovieModel>? favoriteMoviesBox;

  @override
  void initState() {
    super.initState();

    // Open the box
    Hive.openBox<FullMovieModel>('favoritesBox').then((box) {
      setState(() {
        favoriteMoviesBox = box;
      });
    });
  }

  bool isFavorite() {
    // Check if the movie exists in the box
    if (favoriteMoviesBox == null) return false;
    return favoriteMoviesBox!.containsKey(widget.movie.id);
  }

  void toggleFavorite() {
    if (favoriteMoviesBox == null) return;

    if (isFavorite()) {
      // Remove the movie from favorites
      favoriteMoviesBox!.delete(widget.movie.id);
    } else {
      // Add the movie to favorites
      favoriteMoviesBox!.put(widget.movie.id, widget.movie);
    }

    // Trigger a UI update
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite() ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: toggleFavorite,
    );
  }
}
