import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/features/create/widgets/question_input_field.dart';
import 'package:my_quiz/features/create/widgets/question_list.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  Quiz creatingQuiz = const Quiz(title: '', description: '', questions: []);

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Quiz'),
      ),
      body: Column(
        children: [
          // title
          QuestionInputField(
              controller: titleController, hintText: 'Enter a Title'),
          // description
          QuestionInputField(
              controller: descriptionController,
              hintText: 'Enter a Description'),
          // question list
          QuestionList(_saveQuestion),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveQuiz,
        child: const Icon(Icons.check),
      ),
    );
  }

  // creatingQuizにQuestionの追加・修正
  void _saveQuestion(Question question) {
    creatingQuiz =
        creatingQuiz.copyWith(questions: creatingQuiz.questions + [question]);
  }

  // creatingQuizからQuestionの削除
  void _deleteQuestion(int id) {}

  // creatingQuizの保存
  void _saveQuiz() {
    final addQuiz = creatingQuiz.copyWith(
      title: titleController.text,
      description: descriptionController.text,
    );

    final quizInstance =
        FirebaseFirestore.instance.collection('quiz').withConverter<Quiz>(
              fromFirestore: (snapshot, _) => Quiz.fromJson(snapshot.data()!),
              toFirestore: (quiz, _) => quiz.toJson(),
            );
    quizInstance.add(addQuiz);
  }
}
