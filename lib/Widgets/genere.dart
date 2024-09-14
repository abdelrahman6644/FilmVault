import 'package:flutter/material.dart';
import 'package:movies_app/DataBase/generes_types.dart';
import 'package:movies_app/constants.dart';

class Genere extends StatelessWidget {
  const Genere({super.key, required this.id, this.isActive = false});
  final int id;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                color:isActive? Colors.blue : const Color(primaryColor),
                border: Border.all(color: const Color(primaryColor), width: 6),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                genres[id]["name"],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
            );
  }
}
