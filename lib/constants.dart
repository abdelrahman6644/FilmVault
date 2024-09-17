import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Models/movie_model.dart';

const int primaryColor = 0xff242a32;

const apiKey = "0fbd28c5af0552d0d28c436d5ddd5e67";
String posterUrl = "https://image.tmdb.org/t/p/w500";
FullMovieModel DefaultMod = FullMovieModel(
  poster: '',
  id: 0,
  original_title: '',
  backGround: '',
  release_date: '',
  runtime: 0,
  overview: '',
  vote_average: 0,
  Generes: [],
  // FirstGenre: '',
  // SecondGenre: '',
  // ThirdGenre: '',
);

MovieModel DefaultFullMod = MovieModel(
  poster: 'https://lumiere-a.akamaihd.net/v1/images/p_cars_19643_4405006d.jpeg',
  id: 0,
);
