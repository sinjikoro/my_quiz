import 'package:flutter/material.dart';
import 'package:my_quiz/core/enum/config.dart';
import 'package:my_quiz/features/quiz/widgets/gradient_card.dart';

const overQuestionID = -1;

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      onTap: onPressed,
      color: const Color(0xFFE0E0E0),
      itemSize: ItemSize.small,
      child: const Text('次へ'),
    );
  }
}
