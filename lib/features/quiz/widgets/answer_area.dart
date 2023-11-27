import 'package:flutter/material.dart';
import 'package:my_quiz/core/enum/config.dart';
import 'package:my_quiz/features/quiz/widgets/gradient_card.dart';

class AnswerArea extends StatefulWidget {
  const AnswerArea({
    super.key,
    required this.answer,
    required this.selectAnswer,
  });

  final String answer;
  final VoidCallback selectAnswer;

  @override
  State<AnswerArea> createState() => _AnswerAreaState();
}

class _AnswerAreaState extends State<AnswerArea> {
  @override
  Widget build(BuildContext context) {
    return GradientCard(
      onTap: widget.selectAnswer,
      color: const Color(0xFFE0E0E0),
      itemSize: ItemSize.small,
      child: Text(widget.answer),
    );
  }
}
