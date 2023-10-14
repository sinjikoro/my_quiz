import 'package:my_quiz/core/models/question.dart';

class Quiz {
  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
  });

  final int id;
  final String title;
  final String description;
  final List<Question> questions;
}
