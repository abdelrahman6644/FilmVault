import 'package:flutter/material.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 20),
      child: Container(
        padding: const EdgeInsets.only(
          top: 8,
        ),
        height: 230,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 30,),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return ShowPoster(
              Imageurl: 'assets/IMG_20240216_090640.jpg',
              height: 230,
              width: 140,
            );
          },
        ),
      ),
    );
  }
}
