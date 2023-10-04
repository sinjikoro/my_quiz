class Question {
  Question(
    this.id,
    this.question,
    this.answers,
    this.correctAnswer,
  );

  final int id;
  final String question;
  final List<String> answers;
  final String correctAnswer;
}
