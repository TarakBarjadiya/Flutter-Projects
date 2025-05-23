import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250.0,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 30),
          Text(
            "Flutter Quiz App",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(202, 255, 255, 255),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(
                255,
                207,
                205,
                205,
              ),
              backgroundColor: const Color.fromARGB(
                41,
                145,
                138,
                138,
              ),
            ),
            icon: const Icon(Icons.navigate_next),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
