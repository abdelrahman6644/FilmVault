import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Widgets/MoviePageParts/movie_view_builder.dart';

import 'isFavIcon.dart';

class ShowPoster extends StatelessWidget {
  ShowPoster(
      {super.key,
      required this.Imageurl,
      required this.height,
      required this.width,
      required this.movie,
      this.favoriteEnable = true});
  bool favoriteEnable;

  String? Imageurl;
  final double width;
  final double height;
  FullMovieModel movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MovieView(
                    id: movie.id,
                  )),
        );
      },
      child: Stack(
        children: [
          Container(
            // 140 , 200 = 7:10
            width: width.sp,
            height: height.sp,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Imageurl!), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          favoriteEnable
              ? Positioned(
                  right: MediaQuery.sizeOf(context).width / 100,
                  child: IsFavIcon(
                    movie: movie,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

class ShowPosterToDetailes extends StatelessWidget {
  ShowPosterToDetailes({
    super.key,
    required this.Imageurl,
    required this.height,
    required this.width,
  });
  String Imageurl;
  final int width;
  final int height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.sp),
      child: Container(
        // 140 , 200 = 7:10
        width: width.sp,
        height: height.sp,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(Imageurl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
