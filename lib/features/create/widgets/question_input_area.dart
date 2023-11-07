import 'package:flutter/material.dart';
import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/widgets/gutter.dart';
import 'package:my_quiz/features/create/widgets/question_input_field.dart';

class QuestionInputArea extends StatefulWidget {
  const QuestionInputArea({
    super.key,
    required this.question,
    required this.onAdd,
  });

  final Question question;
  final Function(Question) onAdd;

  @override
  State<QuestionInputArea> createState() => _QuestionInputAreaState();
}

class _QuestionInputAreaState extends State<QuestionInputArea> {
  final questionController = TextEditingController();
  final correctController = TextEditingController();
  List<TextEditingController> answerControllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      answerControllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Question
        QuestionInputField(
          controller: questionController,
          headerText: 'question',
          hintText: 'Enter question',
        ),
        // Answer
        for (int i = 0; i < answerControllers.length; i++)
          _AnswerField(i, answerControllers[i]),
        // correctAnswer
        QuestionInputField(
          controller: correctController,
          headerText: 'correct ans',
          hintText: 'Enter correct answer',
        ),
        verticalMargin16,
        // save
        ElevatedButton.icon(
          onPressed: () {
            final addQuestion = Question(
                id: -1,
                question: questionController.text,
                answers: answerControllers.map((e) => e.text).toList(),
                correctAnswer: correctController.text);
            widget.onAdd(addQuestion);
          },
          style: ElevatedButton.styleFrom(padding: allPadding16),
          icon: const Icon(Icons.check),
          label: const Text('save'),
        ),
      ],
    ));
  }
}

class _AnswerField extends StatefulWidget {
  const _AnswerField(this.number, this.controller);

  final int number;
  final TextEditingController controller;

  @override
  State<_AnswerField> createState() => _AnswerFieldState();
}

class _AnswerFieldState extends State<_AnswerField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return QuestionInputField(
      controller: widget.controller,
      headerText: 'answer #${widget.number}',
      hintText: 'Enter answer #${widget.number}',
    );
  }
}
