import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_quiz/core/models/answer.dart';

part 'result.freezed.dart';

@freezed
class Result with _$Result {
  const factory Result({
    required List<Answer> ansewers,
  }) = _Result;
}
