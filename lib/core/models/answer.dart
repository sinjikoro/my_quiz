import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    required String answer,
    required String correctAnswer,
    required bool isCorrect,
  }) = _Answer;
}
