import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ExerciceItem extends StatelessWidget {
  final String nomExercice;
  final String animationPath;

  const ExerciceItem({super.key, required this.nomExercice, required this.animationPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Lottie.asset(
          animationPath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10),
        Text(
          nomExercice,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
