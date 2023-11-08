import 'package:flutter/material.dart';
import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/widgets/gutter.dart';
import 'package:my_quiz/features/create/widgets/question_input_area.dart';

class QuestionList extends StatefulWidget {
  const QuestionList(
    this.questions, {
    required this.addQuestion,
    required this.editQuestion,
    required this.deleteQuestion,
    super.key,
  });

  final List<Question> questions;
  final Function() addQuestion;
  final Function(Question) editQuestion;
  final Function(Question) deleteQuestion;

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.questions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: allPadding32,
                  // question title
                  title: Text(
                      'Question ${widget.questions[index].id} : ${widget.questions[index].question}'),
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
                        widget.deleteQuestion(widget.questions[index]),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: widget.addQuestion,
              child: const Text('add'),
            ),
          ],
        ),
      ),
    );
  }
}
