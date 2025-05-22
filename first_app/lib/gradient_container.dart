import 'package:flutter/material.dart';
import 'package:first_app/dice_roller.dart';

Alignment? startAlignment;
final endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(context) {
    startAlignment = Alignment.topLeft;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: startAlignment!,
          end: endAlignment,
          colors: colors,
        ),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
