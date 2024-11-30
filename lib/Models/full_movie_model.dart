import 'package:hive_flutter/adapters.dart';
part 'full_movie_model.g.dart';

@HiveType(typeId: 0)
class FullMovieModel extends HiveObject {
  @HiveField(0)
  String poster;
  @HiveField(1)
  int id;
  @HiveField(2)
  String? original_title;
  @HiveField(3)
  String? backGround;
  @HiveField(4)
  String? release_date;
  @HiveField(5)
  int? runtime;
  @HiveField(6)
  String? overview;
  @HiveField(7)
  double vote_average;
  @HiveField(8)
  List? Generes;
  @HiveField(9)
  List finalGeneres = [];
  FullMovieModel(
      {required this.poster,
      required this.id,
      required this.original_title,
      required this.backGround,
      required this.release_date,
      required this.runtime,
      required this.overview,
      required this.Generes,
      required this.vote_average});

  factory FullMovieModel.fromJson(json) {
    return FullMovieModel(
      poster: json["poster_path"],
      id: json["id"],
      original_title: json["original_title"],
      backGround: json["backdrop_path"],
      release_date: json["release_date"],
      runtime: json["runtime"] ?? 0,
      overview: json["overview"],
      Generes: json["genres"] ?? [],
      vote_average: json["vote_average"] ?? 0,
    );
  }
}
