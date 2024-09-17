import 'package:dio/dio.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/constants.dart';

class MovieApi {
  Dio dio = Dio();
  MovieApi(this.dio);
  Future<FullMovieModel> getMovie(int id) async {
    try {
      var response = await dio
          .get('https://api.themoviedb.org/3/movie/$id?api_key=$apiKey');
      Map<String, dynamic> jsonData = response.data;
      dynamic movie = jsonData;
      FullMovieModel Movies;
      Movies = FullMovieModel.fromJson(movie);
      if (Movies.Generes != null) {
        for (var gen in Movies.Generes!) {
          print(gen["name"]);
          if (gen["name"] != null) {
            Movies.finalGeneres.add(gen["name"]);
          }
        }
      }
      Movies.poster = posterUrl + Movies.poster;
      Movies.backGround = posterUrl + Movies.backGround;

      return Movies;
    } catch (e) {
      print('Exeption => $e');
      return DefaultMod;
    }
  }
}
