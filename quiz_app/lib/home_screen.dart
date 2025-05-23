import 'package:flutter/material.dart';

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
            color: const Color.fromARGB(
              150,
              255,
              255,
              255,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Flutter Quiz App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
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
