import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Models/full_movie_model.dart';
import 'package:movies_app/Widgets/MoviePageParts/reviews_group.dart';
import 'package:movies_app/Widgets/MoviePageParts/row_in_moviepage.dart';
class UnderPage extends StatefulWidget {
  UnderPage({super.key, required this.movie});
  FullMovieModel movie;
  bool isActive = true;
  @override
  State<UnderPage> createState() => _UnderPageState();
}


class _UnderPageState extends State<UnderPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.isActive = true;
                });
              },
              child: RowInMoviepage(
                index: 0,
                text: 'About Movie',
                isActive: widget.isActive,
              ),
            ),
            const Spacer(
              flex: 4,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.isActive = false;
                });
              },
              child: RowInMoviepage(
                index: 1,
                text: 'Reviews',
                isActive: !(widget.isActive),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
        widget.isActive
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.movie.overview ?? "",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              )
            : ReviewsGroup(
                id: widget.movie.id,
              ),
      ],
    );
  }
}