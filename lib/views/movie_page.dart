import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';
import 'package:movies_app/constants.dart';

class MoviePage extends StatelessWidget {
  MoviePage({super.key, required this.movie});
  FullMovieModel movie;
  @override
  Widget build(BuildContext context) {
    List<Widget> Generes = [];
    // movie.FirstGenre != "" ? Generes.add(movie.FirstGenre!) : "";
    // movie.SecondGenre != "" ? Generes.add(movie.SecondGenre!) : "";
    // movie.ThirdGenre != "" ? Generes.add(movie.ThirdGenre!) : "";
    List<Widget> genere() {
      for (var v in movie.finalGeneres) {
        Generes.add(Text(
          v,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
          ),
        ));
      }
      return Generes;
    }

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Scaffold(
          backgroundColor: const Color(primaryColor),
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.cyan,
            ),
            title: const Row(
              children: [
                Spacer(
                  flex: 5,
                ),
                Center(
                  child: Text(
                    'Movie Details',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(
                  flex: 8,
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                TopOfPage(
                  movie: movie,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.date_range_rounded,
                      color: Colors.grey,
                      size: 14.sp,
                    ),
                    Text(
                      ' ${movie.release_date != null && movie.release_date!.length >= 4 ? movie.release_date!.substring(0, 4) : 'Unknown'}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      '  |  ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey,
                      size: 14.sp,
                    ),
                    Text(
                      ' ${movie.runtime} minutes',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      '  |  ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                    Column(
                      children: genere(),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(top: 40, left: 15),
                  child: const Text(
                    'About Movie',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: 115,
                      child: Divider(
                        color: Color(0xFF3a3f47),
                        height: 15,
                        thickness: 4,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(14),
                  child: Text(
                    movie.overview!,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

/*
                        Text(
                          movie.FirstGenre ?? "",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        )
*/

class TopOfPage extends StatelessWidget {
  TopOfPage({super.key, required this.movie});
  FullMovieModel movie;
  @override
  Widget build(BuildContext context) {
    double d = movie.vote_average;
    String movieVote = d.toStringAsFixed(2);
    String poster = posterUrl + movie.poster!;
    String background = posterUrl + movie.backGround!;
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
                      image: NetworkImage(background), fit: BoxFit.cover),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(13))),
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
            width: 230.w,
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
                  color: Color(0xff373740),
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
