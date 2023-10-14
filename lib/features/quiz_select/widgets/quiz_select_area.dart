import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quiz/core/models/quiz.dart';

class QuizSelectArea extends ConsumerWidget {
  const QuizSelectArea(this.quiz, {super.key});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        context.push('/quiz/1', extra: quiz);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(200),
      ),
      child: Text(quiz.description),
    );
  }
}
