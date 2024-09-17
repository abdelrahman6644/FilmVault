import 'package:dio/dio.dart';
import 'package:movies_app/Models/review_model.dart';
import 'package:movies_app/constants.dart';

class ReviewService {
  Dio dio = Dio();
  ReviewService(this.dio);
  Future<List<ReviewModel>> getReview(int id) async {
    try {
      var response = await dio.get(
          'https://api.themoviedb.org/3/movie/$id/reviews?&api_key=$apiKey');
      Map<String, dynamic> jsonData = response.data;
      dynamic reviews = jsonData["results"];
      List<ReviewModel> reviewModel = [];
      for (var rev in reviews) {
        reviewModel.add(ReviewModel.fromJson(rev));
      }
      return reviewModel;
    } catch (e) {
      print('Exeption => $e');
      return [];
    }
  }
}
