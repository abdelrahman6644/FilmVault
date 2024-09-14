import 'package:flutter/material.dart';
import 'package:movies_app/DataBase/generes_types.dart';
import 'package:movies_app/Widgets/popular_movies.dart';
import 'package:movies_app/Widgets/customTextField.dart';
import 'package:movies_app/Widgets/genere.dart';
import 'package:movies_app/Widgets/show_movies_by_genere.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        textField(
          hint: 'Search',
          onChanged: (String name) {},
          icon: Icons.search,
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            SizedBox(
              width: 25,
            ),
            Text(
              'Trending',
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            Spacer(),
          ],
        ),
        const PopularMovies(),
        const Row(
          children: [
            SizedBox(
              width: 25,
            ),
            Text(
              'Upcoming',
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            Spacer(),
          ],
        ),
        const PopularMovies(),
        ShowMoviesByGenere(),
      ]),
    );
  }
}
