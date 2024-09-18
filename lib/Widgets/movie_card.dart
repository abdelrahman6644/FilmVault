import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';

class MovieCard extends StatelessWidget {
  MovieCard({super.key, required this.movie});
  FullMovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 30.0, bottom: 0, left: 30.0, right: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ShowPoster(
              Imageurl: movie.poster,
              height: 120,
              width: 100,
              movieID: movie.id,
            ),
          ),
          SizedBox(
            width: 230,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Text(
                        movie.original_title ?? "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.date_range_rounded,
                      color: Colors.grey,
                      size: 14.sp,
                    ),
                    Text(
                      ' ${movie.release_date!.substring(0, 4)}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
