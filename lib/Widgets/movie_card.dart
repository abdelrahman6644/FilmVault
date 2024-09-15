import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

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
              Imageurl: 'assets/IMG_20240216_090640.jpg',
              height: 120,
              width: 100,
            ),
          ),
          Container(
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
                SizedBox(
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
