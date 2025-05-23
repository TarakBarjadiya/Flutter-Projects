import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestartQuiz,
  });

  final List<String> chosenAnswers;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummaryData();

    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['chosen_answer'] ==
          data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestion out of $numTotalQuestion questions correctly!",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                  41,
                  145,
                  138,
                  138,
                ),
              ),
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
              onPressed: onRestartQuiz,
              label: const Text(
                "Restart Quiz",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
