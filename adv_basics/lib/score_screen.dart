import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final List<String> answers;

  ScoreScreen({
    required this.answers,
    super.key,
  });

  final int totalQuestions = questions.length;

  int totalCorrectAnswers() {
    return questions.asMap().entries.fold(
      0,
      (previousValue, question) {
        final correctAnswer = question.value.correctAnswer;
        final selectedAnswer = answers[question.key];
        return correctAnswer == selectedAnswer
            ? previousValue + 1
            : previousValue;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(
              'You answered ${answers.length} out of $totalQuestions questions!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 213, 241, 56),
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
