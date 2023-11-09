import 'package:my_quiz/core/models/answer.dart';
import 'package:my_quiz/core/models/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_result_provider.g.dart';

@Riverpod(keepAlive: true)
class QuizResult extends _$QuizResult {
  @override
  Result build() {
    return const Result(answers: []);
  }

  void addAnswer(Answer answer) =>
      state = state.copyWith(answers: [...state.answers, answer]);

  void clear() => state = const Result(answers: []);
}
