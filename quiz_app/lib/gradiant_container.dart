import 'package:flutter/material.dart';
import 'package:quiz_app/home_screen.dart';

class GradiantContainer extends StatelessWidget {
  GradiantContainer(this.colors, {super.key});

  List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(child: HomeScreen()),
    );
  }
}
