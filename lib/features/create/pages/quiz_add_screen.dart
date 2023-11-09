import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quiz/core/Provider/quiz_instance_provider.dart';
import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/features/create/widgets/question_input_field.dart';
import 'package:my_quiz/features/create/widgets/question_list_area.dart';

class CreateScreen extends ConsumerStatefulWidget {
  const CreateScreen({super.key});

  @override
  ConsumerState<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends ConsumerState<CreateScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final emptyQuestion = const Question(
    id: -1,
    question: 'empty question',
    answers: ['', ''],
    correctAnswer: '',
  );
  Quiz _creatingQuiz = const Quiz(title: '', description: '', questions: []);
  Quiz get creatingQuiz => _creatingQuiz;

  set creatingQuiz(Quiz quiz) {
    setState(() {
      _creatingQuiz = quiz.copyWith(
        questions: _sortQuestionIds(quiz.questions),
      );
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    creatingQuiz = creatingQuiz.copyWith(
      questions: [emptyQuestion],
    );
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
            controller: titleController,
            hintText: 'Enter a Title',
          ),
          // description
          QuestionInputField(
            controller: descriptionController,
            hintText: 'Enter a Description',
          ),
          // question list
          QuestionListArea(
            creatingQuiz.questions,
            addQuestion: _addQuestion,
            editQuestion: _editQuestion,
            deleteQuestion: _deleteQuestion,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveQuiz,
        child: const Icon(Icons.check),
      ),
    );
  }

  void _addQuestion() => creatingQuiz = creatingQuiz.copyWith(
        questions: creatingQuiz.questions + [emptyQuestion],
      );

  void _editQuestion(Question question) => creatingQuiz = creatingQuiz.copyWith(
        questions: creatingQuiz.questions
            .map((q) => q.id == question.id ? question : q)
            .toList(),
      );

  void _deleteQuestion(Question question) =>
      creatingQuiz = creatingQuiz.copyWith(
        questions:
            creatingQuiz.questions.where((q) => q.id != question.id).toList(),
      );

  List<Question> _sortQuestionIds(List<Question> questions) => questions
      .asMap()
      .map(
        (index, question) => MapEntry(
          index,
          question.copyWith(
            id: index + 1,
          ),
        ),
      )
      .values
      .toList();

  Future<void> _saveQuiz() async {
    final addQuiz = creatingQuiz.copyWith(
      title: titleController.text,
      description: descriptionController.text,
    );

    final quizInstance = ref.read(quizInstanceProvider);

    await quizInstance.add(addQuiz);
  }
}
