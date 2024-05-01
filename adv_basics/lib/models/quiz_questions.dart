class QuizQuestions {
  const QuizQuestions({
    required this.questionText,
    required this.answers,
    required this.correctAnswer,
  });

  final String questionText;
  final List<String> answers;
  final String correctAnswer;
}
