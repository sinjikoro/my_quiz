import 'package:flutter/material.dart';

class AnswerArea extends StatelessWidget {
  const AnswerArea(this.answer, {super.key});

  final String answer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(140),
      ),
      child: Text(answer),
    );
  }
}