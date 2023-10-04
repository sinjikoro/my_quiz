import 'package:my_quiz/core/models/question.dart';

class Quiz {
  Quiz(
    this.id,
    this.title,
    this.description,
    this.questions,
  );

  final int id;
  final String title;
  final String description;
  final List<Question> questions;
}
