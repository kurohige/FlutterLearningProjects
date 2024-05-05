import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/score_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen'; // it can be null or none.
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void handleQuizCompletion(List<String> answers) {
    selectedAnswers = answers;
    setState(() {
      activeScreen = 'score-screen';
    });
  }

  void returnToStartScreen() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = const SizedBox();
    if (activeScreen == 'start-screen') {
      currentScreen = StartScreen(switchScreen);
    } else if (activeScreen == 'questions-screen') {
      currentScreen = QuestionsScreen(onCompletedQuiz: handleQuizCompletion);
    } else if (activeScreen == 'score-screen') {
      currentScreen = ScoreScreen(
          answers: selectedAnswers, returnFunction: returnToStartScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purpleAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
