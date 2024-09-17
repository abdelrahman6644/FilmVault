import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/review_model.dart';
import 'package:movies_app/Services/APIs/review_api.dart';
import 'package:movies_app/Widgets/MoviePageParts/review_messsage.dart';
import 'package:movies_app/Widgets/message_error.dart';

class ReviewsGroup extends StatefulWidget {
  ReviewsGroup({
    super.key,
    required this.id,
  });
  int id;

  @override
  State<ReviewsGroup> createState() => _ReviewsGroupState();
}

class _ReviewsGroupState extends State<ReviewsGroup> {
  var future;
  @override
  void initState() {
    super.initState();
    future = ReviewService(Dio()).getReview(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ReviewModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: ListView.builder(
              itemCount: snapshot.data != null ? snapshot.data!.length : 0,
              itemBuilder: (context, index) {
                return snapshot.data != null
                    ? ReviewMesssage(
                        Username: snapshot.data![index].author,
                        Rate: snapshot.data![index].rating,
                        content: snapshot.data![index].content,
                      )
                    : const MessageError(
                        Message: 'No Reviews Found',
                      );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return const MessageError(
            Message: 'There Was an Error Please try Later',
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              const Center(child: CircularProgressIndicator()),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return const MessageError(
            Message: 'There Was an Error Please try Later',
          );
        } else {
          return const MessageError(
            Message: 'There Was an Error Please try Later',
          );
        }
      },
    );
  }
}
