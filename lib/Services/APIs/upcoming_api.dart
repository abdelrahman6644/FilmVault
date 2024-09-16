import 'package:dio/dio.dart';
import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/constants.dart';

class UpcomingApi {
  Dio dio = Dio();
  UpcomingApi(this.dio);

  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      var response = await dio
          .get('https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> Movies = jsonData["results"];
      List<MovieModel> UpcomingMovies = [];
      for (var movie in Movies) {
        UpcomingMovies.add(MovieModel.fromJson(movie));
      }
      return UpcomingMovies;
    } catch (e) {
      return [];
    }
  }
}
