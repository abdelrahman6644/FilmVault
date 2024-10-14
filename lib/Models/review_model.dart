class ReviewModel {
  String author;
  double? rating;
  String content;
  ReviewModel({required this.author, required this.content, required this.rating});

  factory ReviewModel.fromJson (json){
    return ReviewModel(
      author: json["author"], 
      content: json["content"], 
      rating: json["author_details"]["rating"]);
  }
}