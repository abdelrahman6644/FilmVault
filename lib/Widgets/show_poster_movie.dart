import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/Widgets/MoviePageParts/movie_view_builder.dart';

class ShowPoster extends StatelessWidget {
  ShowPoster({
    super.key,
    required this.Imageurl,
    required this.height,
    required this.width,
    required this.movieID,
  });
  String? Imageurl;
  final int width;
  final int height;
  int movieID;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.sp),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieView(
                      id: movieID,
                    )),
          );
        },
        child: Container(
          // 140 , 200 = 7:10
          width: width.sp,
          height: height.sp,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Imageurl!), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
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
              DecorationImage(
                image: NetworkImage(Imageurl),
                fit: BoxFit.cover
                ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
