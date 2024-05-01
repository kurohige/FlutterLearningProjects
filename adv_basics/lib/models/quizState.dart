class QuizState {
  final int currentQuestionIndex;
  final List<String> answers;

  const QuizState({
    required this.currentQuestionIndex,
    required this.answers,
  });

  QuizState copyWith({
    int? currentQuestionIndex,
    List<String>? answers,
  }) {
    return QuizState(
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      answers: answers ?? this.answers,
    );
  }
}
