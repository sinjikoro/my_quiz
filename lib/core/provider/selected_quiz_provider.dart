import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_quiz_provider.g.dart';

@riverpod
class SelectedQuiz extends _$SelectedQuiz {
  @override
  Quiz build() {
    return Quiz(-1, '', '', []);
  }

  void select(Quiz selectedQuiz) {
    state = selectedQuiz;
  }

  Question getQuestion(int id) {
    return state.questions.firstWhere(
      (element) => element.id == id,
      orElse: () => Question(-1, '', [], ''),
    );
  }
}
