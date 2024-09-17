import 'package:dio/dio.dart';
import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/constants.dart';

class UpcomingApi {
  Dio dio = Dio();
  final String type;
  /*
    type: 
      - upcoming
      - top_rated
      - now_playing
      - popular
   */
  UpcomingApi(this.dio, {required this.type});

  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      var response = await dio
          .get('https://api.themoviedb.org/3/movie/$type?api_key=$apiKey');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> Movies = jsonData["results"];
      List<MovieModel> UpcomingMovies = [];
      for (var movie in Movies) {
        UpcomingMovies.add(MovieModel.fromJson(movie));
      }
        for(var mo in UpcomingMovies){
      mo.poster = posterUrl + mo.poster;
    }
      return UpcomingMovies;
    } catch (e) {
      return [];
    }
  }
}
