import 'package:flutter/material.dart';
import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/widgets/gutter.dart';
import 'package:my_quiz/features/create/widgets/question_input_area.dart';

class QuestionList extends StatefulWidget {
  const QuestionList({super.key});

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
          title: Text(
              'Question ${questions[index].id} : ${questions[index].question}'),
          subtitle: QuestionInputArea(
            question: questions[index],
            onAdd: addQuestion,
          ),
          trailing: const IconButton(
            icon: Icon(Icons.delete),
            onPressed: deleteQuestion,
          ),
        );
      },
    );
  }
}

void addQuestion(Question question) {
  //TODO : add question
  debugPrint(question.question);
  for (final ans in question.answers) {
    debugPrint(ans);
  }
  debugPrint(question.correctAnswer);
}

void deleteQuestion() {
  //TODO : delete question
}
