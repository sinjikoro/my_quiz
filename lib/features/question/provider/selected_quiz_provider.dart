import 'package:my_quiz/core/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_quiz_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedQuiz extends _$SelectedQuiz {
  final empty = const Quiz(title: '', description: '', questions: []);

  @override
  Quiz build() {
    return empty;
  }

  set quiz(Quiz quiz) => state = quiz;
  Quiz get quiz => state;

  void clear() => state = empty;
}
