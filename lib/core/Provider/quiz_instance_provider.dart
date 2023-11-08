import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_instance_provider.g.dart';

// Provider
@riverpod
CollectionReference<Quiz> quizInstance(QuizInstanceRef ref) =>
    FirebaseFirestore.instance.collection('quiz').withConverter<Quiz>(
          fromFirestore: (snapshot, _) => Quiz.fromJson(snapshot.data()!),
          toFirestore: (quiz, _) => quiz.toJson(),
        );
