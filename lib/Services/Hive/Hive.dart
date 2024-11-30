// import 'package:hive_flutter/adapters.dart';
// import 'package:movies_app/Models/full_movie_model.dart';

// class hive {
//   var box = Hive.openBox('movies');

//   addMovie(FullMovieModel movie) async {
//     await Hive.openBox<FullMovieModel>("movies");
//     await box.put(movie.id, movie);
//     box.close();
//   }

//   removeMovie(FullMovieModel movie) async {
//     box.delete(movie.id);
//     box.close();
//   }

//   printBox(FullMovieModel movie) async {
//     print(box.get(movie.id));
//   }
// }
