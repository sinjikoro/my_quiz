import 'package:flutter/material.dart';
import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/widgets/gutter.dart';
import 'package:my_quiz/features/create/widgets/question_input_area.dart';

class QuestionList extends StatefulWidget {
  const QuestionList(this.saveQuestion, {super.key});

  final Function(Question) saveQuestion;

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  final questions = List<Question>.generate(
      1,
      (i) => Question(
          id: i + 1,
          question: 'test',
          answers: ['ans-1'],
          correctAnswer: 'ans-x'));

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: allPadding32,
          // question title
          title: Text(
              'Question ${questions[index].id} : ${questions[index].question}'),
          // question inputArea
          subtitle: QuestionInputArea(
            question: questions[index],
            onAdd: addQuestion,
          ),
          // delete button
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: deleteQuestion,
          ),
        );
      },
    );
  }

  void addQuestion(Question question) => widget.saveQuestion(question);

  void deleteQuestion() {
    //TODO : delete question
  }
}
