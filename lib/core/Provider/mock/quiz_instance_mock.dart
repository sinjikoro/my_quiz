// mock class
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/models/quiz.dart';

final quizInstance =
    FakeFirebaseFirestore().collection('quiz').withConverter<Quiz>(
          fromFirestore: (snapshot, _) => Quiz.fromJson(snapshot.data()!),
          toFirestore: (quiz, _) => quiz.toJson(),
        );
// mock
Future<CollectionReference<Quiz>> quizInstanceMock() async {
  for (final quiz in _dummyQuizs) {
    await quizInstance.add(quiz);
  }
  return quizInstance;
}

// dummy data
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
    correctAnswer: 'ロシア',
  ),
  const Question(
    id: 2,
    question: '一番GDPの多い国は？',
    answers: ['アメリカ', '中国', '日本'],
    correctAnswer: 'アメリカ',
  ),
  const Question(
    id: 3,
    question: '一番人口の多い国は？',
    answers: ['インド', 'アメリカ', '中国'],
    correctAnswer: '中国',
  ),
  const Question(
    id: 4,
    question: '一番南に位置する国は？',
    answers: ['オーストラリア', '南極', '南アフリカ共和国'],
    correctAnswer: '南アフリカ共和国',
  ),
];
