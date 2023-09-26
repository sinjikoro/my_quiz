import 'package:flutter/material.dart';
import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/features/quiz_select/widgets/quiz_select_area.dart';
import 'package:my_quiz/features/quiz_select/widgets/welcome_image.dart';

enum QuizLevel { easy, normal, hard }
class QuizListScreen extends StatefulWidget {
  const QuizListScreen({super.key});

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  @override
  Widget build(BuildContext context) {
    final _quizes = _dummyQuizs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('国旗クイズ!'),
      ),
      body: Column(children: [
        const WelcomeImage(),
        for (final quiz in _quizes) 
          QuizSelectArea(quiz),
      ]),
    );
  }
}

List<Quiz> _dummyQuizs = [
  Quiz(1, '初級', 'かんたんだよ', _dummyQuestion),
  Quiz(1, '中級', 'ふつうだよ', _dummyQuestion),
  Quiz(1, '上級', 'むずかしいよ', _dummyQuestion),
  ];

List<Question> _dummyQuestion = [
  Question(1, 'question', ['a', 'b', 'c'], 1),
  Question(1, 'question', ['a', 'b', 'c'], 1),
  Question(1, 'question', ['a', 'b', 'c'], 1),
  Question(1, 'question', ['a', 'b', 'c'], 1),
  ];