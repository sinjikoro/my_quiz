import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required int id,
    required String question,
    required List<String> answers,
    required String correctAnswer,
  }) = _Question;
}
