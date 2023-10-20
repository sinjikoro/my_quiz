import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_quiz/core/models/question.dart';

part 'quiz.freezed.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required int id,
    required String title,
    required String description,
    required List<Question> questions,
  }) = _Quiz;
}
