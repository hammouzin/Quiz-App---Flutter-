class QuizQuestion {
  const QuizQuestion(this.text, this.answers, this.correctAnswerIndex);

  final String text;
  final List<String> answers;
  final int correctAnswerIndex;  
  String get correctAnswer {
    return answers[correctAnswerIndex];
  }

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}