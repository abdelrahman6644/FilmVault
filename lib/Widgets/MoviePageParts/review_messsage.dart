import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewMesssage extends StatelessWidget {
  ReviewMesssage(
      {super.key,
      required this.Username,
      required this.Rate,
      required this.content});
  String Username;
  String content;
  double Rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
            width: 0.1,
          ),
          boxShadow:
              List.filled(10, BoxShadow(blurRadius: 0, color: Colors.black45)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    Username,
                    style: TextStyle(color: Color(0xffF5F5DC), fontSize: 18.sp),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                  Row(
                    children: [
                      Icon(
                        Rate == 0
                            ? Icons.star_border
                            : (Rate == 1 ? Icons.star_half : Icons.star),
                        color: Colors.orange,
                        size: 22,
                      ),
                      Icon(
                        Rate < 3
                            ? Icons.star_border
                            : (Rate == 3 ? Icons.star_half : Icons.star),
                        color: Colors.orange,
                        size: 22,
                      ),
                      Icon(
                        Rate < 5
                            ? Icons.star_border
                            : (Rate == 5 ? Icons.star_half : Icons.star),
                        color: Colors.orange,
                        size: 22,
                      ),
                      Icon(
                        Rate < 7
                            ? Icons.star_border
                            : (Rate == 7 ? Icons.star_half : Icons.star),
                        color: Colors.orange,
                        size: 22,
                      ),
                      Icon(
                        Rate < 9
                            ? Icons.star_border
                            : (Rate == 9 ? Icons.star_half : Icons.star),
                        color: Colors.orange,
                        size: 22,
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 24),
              width: MediaQuery.of(context).size.width / 1.2,
              child: Text(
                content,
                style: const TextStyle(
                    color: Color.fromARGB(255, 179, 174, 174), fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
