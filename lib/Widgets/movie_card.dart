import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';

class MovieCard extends StatelessWidget {
  MovieCard({super.key});
  MovieModel movie = MovieModel(poster: '', id: 3);
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
              Imageurl: 'https://cdn.motor1.com/images/mgl/mrz1e/s1/coolest-cars-feature.webp',
              height: 120,
              width: 100, 
              movie: movie ,
            ),
          ),
          SizedBox(
            width: 230,
            child: Column(
              children: [
                Text(
                  'Spider-Man : No Way Home',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      overflow: TextOverflow.ellipsis),
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
                      ' 2021',
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
                      ' 148 minutes',
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
                      Icons.movie_rounded,
                      color: Colors.grey,
                      size: 14.sp,
                    ),
                    Text(
                      ' Action',
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
