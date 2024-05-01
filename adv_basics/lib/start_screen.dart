import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(138, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.50,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),

          const SizedBox(height: 80),
          const Text(
            'Learn Flutter with this quiz app!',
            style: TextStyle(
              color: Color.fromARGB(255, 209, 205, 213),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
            ),
            icon: const Icon(Icons.plumbing, color: Colors.white),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
