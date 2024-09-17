class FullMovieModel {
  String poster;
  int id;
  String? original_title;
  String backGround;
  String? release_date;
  int runtime;
  String? overview;
  double vote_average;
  List? Generes;
  List finalGeneres = [];
  // String? FirstGenre;
  // String? SecondGenre;
  // String? ThirdGenre;
  FullMovieModel(
      {required this.poster,
      required this.id,
      required this.original_title,
      required this.backGround,
      required this.release_date,
      required this.runtime,
      required this.overview,
      required this.Generes,
      // required this.FirstGenre,
      // required this.SecondGenre,
      // required this.ThirdGenre,
      required this.vote_average});
  factory FullMovieModel.fromJson(json) {
    return FullMovieModel(
      poster: json["poster_path"],
      id: json["id"],
      original_title: json["original_title"],
      backGround: json["backdrop_path"],
      release_date: json["release_date"],
      runtime: json["runtime"],
      overview: json["overview"],
      Generes: json["genres"],
      // FirstGenre: json["genres"][0]["name"]?? "",
      // SecondGenre: json["genres"][1]["name"]??"",
      // ThirdGenre: json["genres"][2]["name"]?? "",
      vote_average: json["vote_average"],
    );
  }
}
