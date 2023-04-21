import 'package:flutter/material.dart';
import 'package:my_quiz/widget/answer_panel.dart';
import 'package:my_quiz/widget/question_panel.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        QuestionPanel(),
        AnswerPanel(),
      ]),
    );
  }
}
