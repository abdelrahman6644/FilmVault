import 'package:flutter/material.dart';
import 'package:movies_app/DataBase/generes_types.dart';
import 'package:movies_app/constants.dart';

class Genere extends StatelessWidget {
  const Genere({super.key, required this.index, this.isActive = false});
  final int index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isActive ? Colors.blue : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Text(
        genres[index]["name"],
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
