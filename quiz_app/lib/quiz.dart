import 'package:flutter/material.dart';
import 'package:quiz_app/gradiant_container.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradiantContainer(const [
          Color.fromARGB(255, 138, 24, 184),
          Color.fromARGB(255, 115, 13, 146),
        ]),
      ),
    );
  }
}
