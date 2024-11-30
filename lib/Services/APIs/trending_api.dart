import 'package:dio/dio.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/constants.dart';

class TrendingApi {
  Dio dio = Dio();
  TrendingApi(this.dio);

  Future<List<FullMovieModel>> getTrending() async {
    try {
      var response = await dio.get(
          'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> Movies = jsonData["results"];
      List<FullMovieModel> trendingMovies = [];
      for (var movie in Movies) {
        trendingMovies.add(FullMovieModel.fromJson(movie));
      }
      for (var mo in trendingMovies) {
        mo.poster = posterUrl + mo.poster;
      }

      return trendingMovies;
    } catch (e) {
      return [];
    }
  }
}
