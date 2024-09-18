import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';

class ViewInRow extends StatelessWidget {
  const ViewInRow({
    super.key,
    required this.movies,
  });
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        padding: const EdgeInsets.only(
          top: 8,
        ),
        height: 190.h,
        child: SizedBox(
          height: 230,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  ShowPoster(
                    Imageurl: movies[index].poster,
                    height: 230,
                    width: 140,
                    movieID: movies[index].id ?? 0,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
