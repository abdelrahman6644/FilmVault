import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Widgets/MoviePageParts/movie_view_builder.dart';
import 'package:movies_app/Widgets/movie_card.dart';
import 'package:movies_app/constants.dart';

class FavoriteMovies extends StatefulWidget {
  const FavoriteMovies({super.key});

  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  Box<FullMovieModel>? favoriteMoviesBox;

  @override
  void initState() {
    super.initState();

    // Open the favorites box
    Hive.openBox<FullMovieModel>('favoritesBox').then((box) {
      setState(() {
        favoriteMoviesBox = box;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (favoriteMoviesBox == null) {
      return const Center(child: CircularProgressIndicator());
    }

    ValueListenable<Box<FullMovieModel>> valueListenable =
        favoriteMoviesBox!.listenable();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        slivers: [
          const SliverAppBar(
            iconTheme: IconThemeData(
              color: Colors.cyan,
            ),
            pinned: true,
            expandedHeight: 110.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Favorite Movies",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ValueListenableBuilder(
              valueListenable: valueListenable,
              builder: (BuildContext context, Box<FullMovieModel> box,
                  Widget? child) {
                if (box.isEmpty) {
                  return const Center(
                    child: Text("No Favorite Movies"),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    FullMovieModel movie = box.getAt(index) ?? DefaultFullMod;

                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieView(id: movie.id),
                        ),
                      ),
                      child: MovieCard(movie: movie),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
