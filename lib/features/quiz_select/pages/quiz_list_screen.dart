import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/features/quiz_select/widgets/quiz_select_area.dart';
import 'package:my_quiz/features/quiz_select/widgets/welcome_image.dart';

class QuizListScreen extends ConsumerStatefulWidget {
  const QuizListScreen({super.key});

  @override
  QuizListScreenState createState() => QuizListScreenState();
}

class QuizListScreenState extends ConsumerState<QuizListScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final quizInstance =
        FirebaseFirestore.instance.collection('quiz').withConverter<Quiz>(
              fromFirestore: (snapshot, _) => Quiz.fromJson(snapshot.data()!),
              toFirestore: (quiz, _) => quiz.toJson(),
            );

    return FutureBuilder(
      future: quizInstance.get(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return loadingWidget();
          case ConnectionState.done:
            if (snapshot.hasError) {
              debugPrint(snapshot.error.toString());
              return errorWidget();
            }

            return Scaffold(
              appBar: AppBar(
                title: const Text('国旗クイズ!'),
              ),
              body: Column(children: [
                const WelcomeImage(),
                for (final quiz in getList<Quiz>(snapshot.data!))
                  QuizSelectArea(quiz),
              ]),
            );
          default:
            return loadingWidget();
        }
      },
    );
  }

  List<T> getList<T>(QuerySnapshot snapshot) {
    List<T> list = [];
    for (final e in snapshot.docs) {
      list.add(e.data() as T);
    }
    return list;
  }

  Widget loadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget errorWidget() {
    return const Center(child: Text('loading error!'));
  }
}

List<Quiz> _dummyQuizs = [
  Quiz(title: '初級', description: 'かんたんだよ', questions: _dummyQuestion),
  Quiz(title: '中級', description: 'ふつうだよ', questions: _dummyQuestion),
  Quiz(title: '上級', description: 'むずかしいよ', questions: _dummyQuestion),
];

List<Question> _dummyQuestion = [
  const Question(
      id: 1,
      question: '一番面積の大きい国は？',
      answers: ['中国', 'アメリカ', 'ロシア'],
      correctAnswer: 'ロシア'),
  const Question(
      id: 2,
      question: '一番GDPの多い国は？',
      answers: ['アメリカ', '中国', '日本'],
      correctAnswer: 'アメリカ'),
  const Question(
      id: 3,
      question: '一番人口の多い国は？',
      answers: ['インド', 'アメリカ', '中国'],
      correctAnswer: '中国'),
  const Question(
      id: 4,
      question: '一番南に位置する国は？',
      answers: ['オーストラリア', '南極', '南アフリカ共和国'],
      correctAnswer: '南アフリカ共和国'),
];
