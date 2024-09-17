import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Models/review_model.dart';
import 'package:movies_app/Services/APIs/review_api.dart';
import 'package:movies_app/Widgets/MoviePageParts/review_messsage.dart';
import 'package:movies_app/Widgets/MoviePageParts/row_in_moviepage.dart';
import 'package:movies_app/Widgets/message_error.dart';

import 'package:movies_app/constants.dart';
import 'package:movies_app/Widgets/MoviePageParts/top_of_movie_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                UnderPage(
                  movie: movie,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class UnderPage extends StatefulWidget {
  UnderPage({super.key, required this.movie});
  FullMovieModel movie;
  bool isActive = true;
  @override
  State<UnderPage> createState() => _UnderPageState();
}

class _UnderPageState extends State<UnderPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.isActive = true;
                });
              },
              child: RowInMoviepage(
                index: 0,
                text: 'About Movie',
                isActive: widget.isActive,
              ),
            ),
            const Spacer(
              flex: 4,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.isActive = false;
                });
              },
              child: RowInMoviepage(
                index: 1,
                text: 'Reviews',
                isActive: !(widget.isActive),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
        widget.isActive
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.movie.overview ?? "",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              )
            : ReviewsGroup(
                id: widget.movie.id,
              ),
      ],
    );
  }
}

class ReviewsGroup extends StatefulWidget {
  ReviewsGroup({
    super.key,
    required this.id,
  });
  int id;

  @override
  State<ReviewsGroup> createState() => _ReviewsGroupState();
}

class _ReviewsGroupState extends State<ReviewsGroup> {
  var future;
  @override
  void initState() {
    super.initState();
    future = ReviewService(Dio()).getReview(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ReviewModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: ListView.builder(
              // scrollDirection: Axis.vertical,
              // physics: PageScrollPhysics(),
              itemCount: snapshot.data != null ? snapshot.data!.length : 0,
              itemBuilder: (context, index) {
                return ReviewMesssage(
                  Username: snapshot.data![index].author,
                  Rate: snapshot.data![index].rating,
                  content: snapshot.data![index].content,
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return const MessageError(
            Message: 'There Was an Error Please try Later',
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              const Center(child: CircularProgressIndicator()),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return const MessageError(
            Message: 'There Was an Error Please try Later',
          );
        } else {
          return const MessageError(
            Message: 'There Was an Error Please try Later',
          );
        }
      },
    );
  }
}
