class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    List<String> copy = List.of(answers);
    copy.shuffle();
    return copy;
  }
}
