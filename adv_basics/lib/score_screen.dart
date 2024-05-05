import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/models/quiz_questions.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final List<String> answers;
  final VoidCallback returnFunction;
  final int totalQuestions = questions.length;

  ScoreScreen({
    required this.answers,
    required this.returnFunction,
    super.key,
  });

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
    final int correctAnswers = totalCorrectAnswers();
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(
              'Out of $totalQuestions you have answered $correctAnswers correctly!!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 213, 241, 56),
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              // wrap the listview with expanded
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final selectedAnswer = answers[index];
                  return QuestionsAndAnswers(
                    question: question,
                    selectedAnswer: selectedAnswer,
                  );
                },
              ),
            ),
            const Text('list of ansewrs and questions'),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: returnFunction, child: const Text('Restart Quiz')),
          ],
        ),
      ),
    );
  }
}

class QuestionsAndAnswers extends StatelessWidget {
  final QuizQuestions question;
  final String selectedAnswer;
  const QuestionsAndAnswers(
      {required this.question, required this.selectedAnswer, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 61, 59, 59).withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          Text(
            question.questionText,
            style: const TextStyle(
              color: Color.fromARGB(255, 225, 222, 222),
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          ...(question.answers).map(
            (answer) {
              bool isCorrect = answer == question.correctAnswer;
              bool isSelected = selectedAnswer == answer;
              return Row(
                children: [
                  Icon(
                    isSelected && isCorrect
                        ? Icons.check
                        : isSelected && !isCorrect
                            ? Icons.warning
                            : !isSelected && isCorrect
                                ? Icons.check
                                : Icons.close,
                    color: isSelected && isCorrect
                        ? Colors.green
                        : isSelected && !isCorrect
                            ? Colors.yellow
                            : !isSelected && isCorrect
                                ? const Color.fromARGB(255, 251, 251, 251)
                                : Colors.red,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    answer,
                    style: TextStyle(
                        color: isSelected && isCorrect
                            ? Colors.green
                            : isSelected && !isCorrect
                                ? Colors.yellow
                                : !isSelected && isCorrect
                                    ? const Color.fromARGB(255, 251, 251, 251)
                                    : Colors.red,
                        shadows: const [
                          Shadow(
                            offset: Offset(1.5, 1.5),
                            color: Color.fromARGB(255, 11, 10, 10),
                            blurRadius: 1,
                          ),
                        ]),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
