// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class textField extends StatelessWidget {
  textField(
      {super.key,
      required this.hint,
      required this.onChanged,
      required this.icon,
      required this.onFieldSubmitted});
  final regExp = RegExp(
      r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+=' // <-- Notice the escaped symbols
      "'" // <-- ' is added to the expression
      ']');
  final void Function(String)? onFieldSubmitted;
  IconData icon;
  final String hint;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: TextFormField(
        //maxLength: 1,
        style: const TextStyle(color: Colors.white),
        validator: (data) {
          if (data!.isEmpty) {
            return 'value is empty';
          }
          if (data.contains(regExp)) {
            return 'not valid text';
          } else {
            return null;
          }
        },
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          //isCollapsed: true,
          suffixIcon: Icon(
            icon,
            color: const Color.fromARGB(255, 120, 118, 118),
          ),
          filled: true,
          fillColor: const Color(0xff3a3f47),
          hintText: hint,
          hintStyle: TextStyle(
              color: const Color.fromARGB(255, 120, 118, 118), fontSize: 15.sp),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.sp),
            borderSide: const BorderSide(
              color: Color(0xff3a3f47),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.sp),
              borderSide: const BorderSide(color: Colors.white38)),
        ),
      ),
    );
  }
}
