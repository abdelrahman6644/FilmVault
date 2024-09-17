import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowInMoviepage extends StatelessWidget {
  const RowInMoviepage(
      {super.key,
      required this.index,
      this.isActive = false,
      required this.text});
  final int index;
  final bool isActive;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 40, left: 15),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        isActive
            ? Row(
                children: [
                  SizedBox(
                    width: 12.w,
                  ),
                  SizedBox(
                    width: 108.w,
                    child: const Divider(
                      color: Color(0xFF3a3f47),
                      height: 15,
                      thickness: 4,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  SizedBox(
                    width: 12.w,
                  ),
                  SizedBox(
                    width: 108.w,
                    height: 15,
                  ),
                ],
              ),
      ],
    );
  }
}
