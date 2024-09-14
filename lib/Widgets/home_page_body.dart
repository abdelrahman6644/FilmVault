import 'package:flutter/material.dart';
import 'package:movies_app/components/customTextField.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textField(
          hint: 'Search',
          onChanged: (String name) {  }, 
          icon: Icons.search,
          ),
      ]
    );
  }
}