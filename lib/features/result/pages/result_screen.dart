import 'package:flutter/material.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/core/models/result.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.quiz,
    required this.result,
  });

  final Quiz quiz;
  final Result result;

  @override
  Widget build(BuildContext context) {
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
