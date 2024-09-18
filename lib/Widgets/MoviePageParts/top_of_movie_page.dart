import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';

class TopOfPage extends StatelessWidget {
  TopOfPage({super.key, required this.movie});
  FullMovieModel movie;
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
          SizedBox(
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
          ),
          Positioned(
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
          ),
          Positioned(
            top: 280,
            left: 140.sp,
            width: 200.w,
            child: Text(
              movie.original_title!,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
              top: 200.sp,
              left: 300.sp,
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
              ))
        ],
      ),
    );
  }
}

// bool isFav = false;

// IconButton(
//   icon: isFav == false
//       ? const Icon(
//           Icons.favorite,
//           color: Colors.red,
//           size: 30,
//         )
//       : const Icon(
//           Icons.favorite_border,
//           color: Colors.red,
//           size: 30,
//         ),
//   onPressed: () {
//     setState(() {
//       isFav ? false : true;
//     });
//   },
// )
