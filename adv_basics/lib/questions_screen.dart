import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/models/quiz_questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/models/quizState.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  QuizState _quizState = const QuizState(
    currentQuestionIndex: 0,
    answers: [],
  );
  final int numberOfQuestions = questions.length;

  void answerQuestion(String answer) {
    setState(() {
      if (_quizState.currentQuestionIndex >= numberOfQuestions) {
        _quizState = _quizState.copyWith(
          currentQuestionIndex: _quizState.currentQuestionIndex + 1,
          answers: [..._quizState.answers, answer],
        );
        // then it'll us to a new score screen
      } else {
        _quizState = _quizState.copyWith(
          currentQuestionIndex: _quizState.currentQuestionIndex + 1,
          answers: [..._quizState.answers, answer],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestions currentQuestion = questions[_quizState.currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.questionText,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ...(currentQuestion.answers).map((answer) {
            return AnswerButton(
              onTap: () => answerQuestion(answer),
              answer: answer,
            );
          }),
        ],
      ),
    );
  }
}
