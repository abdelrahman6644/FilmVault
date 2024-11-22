import 'package:flutter/material.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/constants.dart';

class IsfavIcon extends StatefulWidget {
  IsfavIcon({super.key, required this.movie});
  FullMovieModel movie;
  @override
  State<IsfavIcon> createState() => _IsfavIconState();
}

class _IsfavIconState extends State<IsfavIcon> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        FavMovies.add(widget.movie);
        setState(() {
          isFav == true ? isFav = false : isFav = true;
        });
      },
    );
  }
}
