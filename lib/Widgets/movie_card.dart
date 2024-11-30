import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Widgets/isFavIcon.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';

class MovieCard extends StatelessWidget {
  MovieCard({super.key, required this.movie});
  FullMovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        bottom: 0,
        left: 10.0,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ShowPoster(
              Imageurl: movie.poster,
              height: 120,
              width: 100,
              movie: movie,
              favoriteEnable: false,
            ),
          ),
          SizedBox(
            width: 230.w,
            child: Column(
              children: [
                Title(movie: movie),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ReleaseDate(movie: movie),
                        Review(movie: movie),
                      ],
                    ),
                    IsFavIcon(
                      movie: movie,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Text(
            movie.original_title ?? "",
            style: TextStyle(fontSize: 20.sp, overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}

class ReleaseDate extends StatelessWidget {
  const ReleaseDate({
    super.key,
    required this.movie,
  });

  final FullMovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.date_range_rounded,
          color: Colors.grey,
          size: 14.sp,
        ),
        Text(
          ' ${movie.release_date!}',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}

class Review extends StatelessWidget {
  const Review({
    super.key,
    required this.movie,
  });

  final FullMovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.rate_review,
          color: Colors.grey,
          size: 14.sp,
        ),
        Text(
          ' ${movie.vote_average}',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
