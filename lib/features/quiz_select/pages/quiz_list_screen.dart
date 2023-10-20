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
    final quizes = _dummyQuizs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('国旗クイズ!'),
      ),
      body: Column(children: [
        const WelcomeImage(),
        for (final quiz in quizes) QuizSelectArea(quiz),
      ]),
    );
  }
}

List<Quiz> _dummyQuizs = [
  Quiz(id: 1, title: '初級', description: 'かんたんだよ', questions: _dummyQuestion),
  Quiz(id: 2, title: '中級', description: 'ふつうだよ', questions: _dummyQuestion),
  Quiz(id: 3, title: '上級', description: 'むずかしいよ', questions: _dummyQuestion),
];

List<Question> _dummyQuestion = [
  Question(1, '一番面積の大きい国は？', ['中国', 'アメリカ', 'ロシア'], 'ロシア'),
  Question(2, '一番GDPの多い国は？', ['アメリカ', '中国', '日本'], 'アメリカ'),
  Question(3, '一番人口の多い国は？', ['インド', 'アメリカ', '中国'], '中国'),
  Question(4, '一番南に位置する国は？', ['オーストラリア', '南極', '南アフリカ共和国'], '南アフリカ共和国'),
];
