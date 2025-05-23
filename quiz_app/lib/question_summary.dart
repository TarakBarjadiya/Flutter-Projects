import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1)
                        .toString(),
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor:
                          data['chosen_answer'] ==
                              data['correct_answer']
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      const SizedBox(height: 5),
                      Text(data['chosen_answer'] as String),
                      Text(
                        data['correct_answer'] as String,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
