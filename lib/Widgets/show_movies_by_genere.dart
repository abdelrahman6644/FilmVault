import 'package:flutter/material.dart';
import 'package:movies_app/DataBase/generes_types.dart';
import 'package:movies_app/Widgets/genere.dart';
import 'package:movies_app/Widgets/show_poster_movie.dart';

class ShowMoviesByGenere extends StatefulWidget {
  ShowMoviesByGenere({
    super.key,
    this.currentGenere = 0,
  });
  int currentGenere;
  @override
  State<ShowMoviesByGenere> createState() => _ShowMoviesByGenereState();
}

class _ShowMoviesByGenereState extends State<ShowMoviesByGenere> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 8),
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genres.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  widget.currentGenere = index;
                  setState(() {});
                },
                child: Genere(
                  id: index,
                  isActive: widget.currentGenere == index,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              mainAxisSpacing: 0,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ShowPoster(
                Imageurl:
                    'https://cdn.motor1.com/images/mgl/mrz1e/s1/coolest-cars-feature.webp',
                height: 200,
                width: 110,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
