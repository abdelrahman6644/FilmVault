class FullMovieModel {
  String? poster;
  int id;
  String? original_title;
  String? backGround;
  String? release_date;
  int? runtime;
  String? overview;
  double vote_average;
  List? Generes;
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
