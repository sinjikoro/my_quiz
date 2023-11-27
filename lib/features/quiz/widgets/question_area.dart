import 'package:flutter/material.dart';
import 'package:my_quiz/core/enum/config.dart';
import 'package:my_quiz/features/quiz/widgets/gradient_card.dart';

class QuestionArea extends StatelessWidget {
  const QuestionArea(this.question, {super.key});

  final String question;

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      color: const Color(0xFFE0E0E0),
      itemSize: ItemSize.large,
      child: Text(question),
    );
  }
}
