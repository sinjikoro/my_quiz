import 'package:flutter/material.dart';

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
    return ElevatedButton(
      onPressed: widget.selectAnswer,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(140),
      ),
      child: Text(widget.answer),
    );
  }
}
