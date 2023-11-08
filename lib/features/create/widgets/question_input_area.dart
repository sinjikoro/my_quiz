import 'package:flutter/material.dart';
import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/widgets/gutter.dart';
import 'package:my_quiz/features/create/widgets/question_input_field.dart';

class QuestionInputArea extends StatefulWidget {
  const QuestionInputArea(
    this.question, {
    this.editQuestion,
    this.deleteQuestion,
    super.key,
  });

  final Question question;
  final Function(Question question)? editQuestion;
  final Function(Question question)? deleteQuestion;

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
    for (int i = 0; i < widget.question.answers.length; i++) {
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
          lostFocusAction: (text) => widget.editQuestion?.call(
            widget.question.copyWith(question: text),
          ),
        ),
        // Answer
        for (int i = 0; i < answerControllers.length; i++)
          _AnswerField(
            i,
            answerControllers[i],
            lostFocusAction: (text) => widget.editQuestion?.call(
              widget.question.copyWith(
                  answers: List<String>.from(widget.question.answers)
                    ..[i] = text),
            ),
          ),

        // correctAnswer
        QuestionInputField(
          controller: correctController,
          headerText: 'correct ans',
          hintText: 'Enter correct answer',
          lostFocusAction: (text) => widget.editQuestion?.call(
            widget.question.copyWith(correctAnswer: text),
          ),
        ),
        verticalMargin16,
      ],
    ));
  }
}

class _AnswerField extends StatefulWidget {
  const _AnswerField(
    this.number,
    this.controller, {
    this.lostFocusAction,
  });

  final int number;
  final TextEditingController controller;
  final Function(String text)? lostFocusAction;

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
      lostFocusAction: widget.lostFocusAction,
    );
  }
}
