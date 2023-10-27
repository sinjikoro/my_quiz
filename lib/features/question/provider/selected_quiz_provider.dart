import 'package:my_quiz/core/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_quiz_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedQuiz extends _$SelectedQuiz {
  @override
  Quiz build() {
    return const Quiz(title: '', description: '', questions: []);
  }

  setQuiz(Quiz quiz) => state = quiz;

  clear() => state = const Quiz(title: '', description: '', questions: []);
}
