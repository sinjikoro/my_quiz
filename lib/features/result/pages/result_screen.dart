import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quiz/features/question/provider/selected_quiz_provider.dart';
import 'package:my_quiz/features/result/provider/quiz_result_provider.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.read(selectedQuizProvider);
    final result = ref.read(quizResultProvider);

    final totalQuestionCount = result.answers.length;
    final correctQuestionCount =
        result.answers.where(((element) => element.isCorrect)).toList().length;

    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text('${quiz.title} ${quiz.description}'),
      ),
      body: Column(children: [
        const Text('Congratulation!'),
        Text('正解数 $correctQuestionCount / $totalQuestionCount'),
        for (final answer in result.answers)
          Text('${answer.answer} ${answer.isCorrect ? '○' : '×'}'),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(140),
              ),
              child: const Text('選択画面へ'),
            ),
          ],
        ),
      ]),
    );
  }
}
