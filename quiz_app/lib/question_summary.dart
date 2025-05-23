import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        data['chosen_answer'] ==
                            data['correct_answer']
                        ? const Color.fromARGB(
                            255,
                            124,
                            223,
                            127,
                          )
                        : const Color.fromARGB(
                            255,
                            238,
                            85,
                            74,
                          ),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1)
                        .toString(),
                    style: TextStyle(
                      color:
                          data['chosen_answer'] ==
                              data['correct_answer']
                          ? const Color.fromARGB(
                              255,
                              13,
                              77,
                              15,
                            )
                          : const Color.fromARGB(
                              255,
                              107,
                              23,
                              16,
                            ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['chosen_answer'] as String,
                        style: GoogleFonts.urbanist(
                          color: const Color.fromARGB(
                            255,
                            99,
                            219,
                            69,
                          ),
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.urbanist(
                          color:
                              data['chosen_answer'] ==
                                  data['correct_answer']
                              ? const Color.fromARGB(
                                  255,
                                  99,
                                  219,
                                  69,
                                )
                              : const Color.fromARGB(
                                  255,
                                  247,
                                  92,
                                  77,
                                ),
                        ),
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
