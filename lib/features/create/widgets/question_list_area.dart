import 'package:flutter/material.dart';
import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/widgets/gutter.dart';
import 'package:my_quiz/features/create/widgets/question_input_area.dart';

class QuestionListArea extends StatefulWidget {
  const QuestionListArea(
    this.questions, {
    this.addQuestion,
    this.editQuestion,
    this.deleteQuestion,
    super.key,
  });

  final List<Question> questions;
  final void Function()? addQuestion;
  final void Function(Question)? editQuestion;
  final void Function(Question)? deleteQuestion;

  @override
  State<QuestionListArea> createState() => _QuestionListStateArea();
}

class _QuestionListStateArea extends State<QuestionListArea> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.questions.length,
              itemBuilder: (context, index) {
                final idText = widget.questions[index].id;
                final questionText = widget.questions[index].question;
                return ListTile(
                  contentPadding: allPadding32,
                  // question title
                  title: Text(
                    'Question $idText : $questionText',
                  ),
                  // question inputArea
                  subtitle: QuestionInputArea(
                    widget.questions[index],
                    editQuestion: widget.editQuestion,
                    deleteQuestion: widget.deleteQuestion,
                  ),
                  // delete button
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        widget.deleteQuestion?.call(widget.questions[index]),
                  ),
                );
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: widget.addQuestion,
              label: const Text('Add Question'),
            ),
          ],
        ),
      ),
    );
  }
}
