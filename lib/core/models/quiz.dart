import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_quiz/core/models/question.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Quiz({
    required String title,
    required String description,
    required List<Question> questions,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}
