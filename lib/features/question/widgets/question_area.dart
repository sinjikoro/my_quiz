import 'package:flutter/material.dart';

class QuestionArea extends StatelessWidget {
  const QuestionArea(this.question, {super.key});

  final String question;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(question),
    );
  }
}
