import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.onAnswerSelect,
    required this.answerText,
  });

  final String answerText;
  final void Function() onAnswerSelect;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onAnswerSelect,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(
          255,
          240,
          224,
          247,
        ),
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: GoogleFonts.urbanist(fontSize: 16),
      ),
    );
  }
}
