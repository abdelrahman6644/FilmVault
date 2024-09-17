class MovieModel {
  String poster;
  int? id;
  MovieModel({required this.poster, required this.id});
  factory MovieModel.fromJson(json){
    return MovieModel(
      poster: json["poster_path"],
      id: json["id"],
      );
  }
}