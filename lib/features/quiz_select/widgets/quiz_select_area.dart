import 'package:flutter/material.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/features/question/presentation/quiz_screen.dart';

class QuizSelectArea extends StatelessWidget {
  const QuizSelectArea(this.quiz, {super.key});

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const QuizScreen()));
    },
    style: ElevatedButton.styleFrom(
      fixedSize: const Size.fromWidth(200),
    ),
    child: Text(quiz.description),
    );
  }
}