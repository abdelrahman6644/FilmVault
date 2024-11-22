import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Widgets/isFavIcon.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';

class TopOfPage extends StatelessWidget {
  TopOfPage({super.key, required this.movie});
  FullMovieModel movie;

  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    double d = movie.vote_average;
    String movieVote = d.toStringAsFixed(2);
    String poster = movie.poster!;
    String background = movie.backGround!;
    return SizedBox(
      height: 300.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Background(background: background),
          Poster(poster: poster),
          Title(movie: movie),
          MovieVote(movieVote: movieVote),
          Positioned(
            right: MediaQuery.sizeOf(context).width / 13,
            child: IsfavIcon(
              movie: movie,
            ),
          )
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
    required this.background,
  });

  final String background;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(background),
              fit: BoxFit.cover,
            ),
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(13))),
      ),
    );
  }
}

class Poster extends StatelessWidget {
  const Poster({
    super.key,
    required this.poster,
  });

  final String poster;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 190,
      left: MediaQuery.of(context).size.width / 11,
      child: Container(
        alignment: Alignment.bottomLeft,
        child: ShowPosterToDetailes(
          Imageurl: poster,
          height: 140,
          width: 100,
        ),
      ),
    );
  }
}

class MovieVote extends StatelessWidget {
  const MovieVote({
    super.key,
    required this.movieVote,
  });

  final String movieVote;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 175.h,
        right: MediaQuery.sizeOf(context).width / 13,
        child: Container(
          width: 60,
          height: 28,
          decoration: BoxDecoration(
            color: const Color(0xff373740),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 3,
              ),
              const Icon(
                Icons.star_border,
                color: Colors.orange,
                size: 22,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                movieVote,
                style: const TextStyle(
                  color: Colors.orange,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
            ],
          ),
        ));
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.movie,
  });

  final FullMovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 280,
      left: 140.sp,
      width: 200.w,
      child: Text(
        movie.original_title!,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
