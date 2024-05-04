import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/models/quiz_questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/models/quiz_state.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  final Function(List<String>) onCompletedQuiz;
  const QuestionsScreen({required this.onCompletedQuiz, super.key});

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
      _quizState = _quizState.copyWith(
        answers: [..._quizState.answers, answer],
      );
      if (_quizState.currentQuestionIndex >= numberOfQuestions - 1) {
        widget.onCompletedQuiz(_quizState.answers);
      } else {
        _quizState = _quizState.copyWith(
          currentQuestionIndex: _quizState.currentQuestionIndex + 1,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestions currentQuestion = questions[_quizState.currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 213, 241, 56),
                fontSize: 24,
              ),
            ),
            ...(currentQuestion.shuffledAnswers).map((answer) {
              return AnswerButton(
                onTap: () => answerQuestion(answer),
                answer: answer,
              );
            }),
          ],
        ),
      ),
    );
  }
}
