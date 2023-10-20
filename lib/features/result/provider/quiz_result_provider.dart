import 'package:my_quiz/core/models/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_result_provider.g.dart';

@Riverpod(keepAlive: true)
class QuizResult extends _$QuizResult {
  @override
  Result build() {
    return Result(answers: []);
  }
}
