import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quiz/core/models/result.dart';
import 'package:my_quiz/features/question/provider/selected_quiz_provider.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({
    super.key,
    required this.result,
  });

  final Result result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(selectedQuizProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('${quiz.title} ${quiz.description}'),
      ),
      body: Column(children: [
        const Text('Congratulation!'),
        const Text('正解数 1 / 1'),
        for (final answer in result.answers)
          Text('${answer.answer} ${answer.isCorrect ? '○' : '×'}'),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(140),
              ),
              child: const Text('もう一度'),
            ),
            const SizedBox(width: 20),
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
