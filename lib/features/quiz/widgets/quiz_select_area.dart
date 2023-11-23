import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/core/router/app_paths.dart';
import 'package:my_quiz/core/widgets/gutter.dart';
import 'package:my_quiz/features/quiz/provider/selected_quiz_provider.dart';
import 'package:my_quiz/features/quiz/widgets/gradient_card.dart';

class QuizSelectArea extends ConsumerWidget {
  const QuizSelectArea(this.quiz, {super.key});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return Padding(
    //   padding: allPadding8,
    //   child: ElevatedButton(
    //     onPressed: () {
    //       ref.read(selectedQuizProvider.notifier).quiz = quiz;
    //       context.push('${Paths.quiz}/1');
    //     },
    //     style: ElevatedButton.styleFrom(
    //       fixedSize: Size.fromWidth(buttonWidth),
    //     ),
    //     // child: Text(quiz.title),
    //     child: GradientCard(
    //       color: Colors.blue,
    //       child: Text(
    //         quiz.title,
    //       ),
    //     ),
    //   ),
    // );
    return InkWell(
      child: GradientCard(
        color: const Color(0xFFEC8870),
        child: Text(quiz.title),
      ),
    );
  }
}
