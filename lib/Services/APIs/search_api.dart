import 'package:dio/dio.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/constants.dart';

class SearchService {
  Dio dio = Dio();
  SearchService(this.dio);

  Future<List<FullMovieModel>> getSearchMovie(String movieName) async {
    try {
      var response = await dio.get(
          'https://api.themoviedb.org/3/search/movie?query=$movieName&api_key=$apiKey');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> movies = jsonData["results"];
      List<FullMovieModel> MoviesSearches = [];

      for (var movie in movies) {
        FullMovieModel mo = FullMovieModel.fromJson(movie);

        // if (!(mo.release_date == null || mo.release_date == "" || mo.poster == "" ||
        // mo.original_title == "" || mo.vote_average == 0)) {
        if (!(mo.backGround == null ||
            mo.poster == null ||
            mo.release_date == "")) {
          mo.poster = posterUrl + mo.poster!;
          mo.backGround = posterUrl + mo.backGround!;
          MoviesSearches.add(mo);
        }

        // }
      }
      return MoviesSearches;
    } catch (e) {
      print("Error fetching movies: $e");
      return [];
    }
  }
}
