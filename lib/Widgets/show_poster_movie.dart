import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowPoster extends StatelessWidget {
  ShowPoster({super.key, required this.Imageurl, required this.height, required this.width});
  String Imageurl;
  final int width;
  final int height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.sp),
      child: GestureDetector(
        child: Container(
          // 140 , 200 = 7:10
          width: width.sp,
          height: height.sp,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(Imageurl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
