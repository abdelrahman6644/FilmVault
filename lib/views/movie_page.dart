import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';
import 'package:movies_app/constants.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Scaffold(
          backgroundColor: const Color(primaryColor),
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.cyan, //change your color here
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
                const TopOfPage(),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      ' 148 minutes',
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
                    'dslfgohdsf hedsf dsfhds klhfds dshf lsdhf fdshfh sdfhdslfhsdfhsf sdffhdshf dshf shf dhsf hsdhfsdhfsdhfsldhlfshdff dfs f s dsf sdfds fd',
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

class TopOfPage extends StatelessWidget {
  const TopOfPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 210.h,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/IMG_20240216_090640.jpg'),
                      fit: BoxFit.cover
                      ),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(13))),
            ),
          ),
          Positioned(
            top: 190,
            left: MediaQuery.of(context).size.width / 11,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: ShowPoster(
                Imageurl: 'assets/IMG_20240216_090640.jpg',
                height: 140,
                width: 100,
              ),
            ),
          ),
          Positioned(
            top: 280,
            left: 140.sp,
            width: 230.w,
            child: const Text(
              'SpiderMan : No Way Home',
              style: TextStyle(
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
                child: const Row(
                  children: [
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.orange,
                      size: 22,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '9.0',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(
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
