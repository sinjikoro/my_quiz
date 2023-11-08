import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quiz/core/models/question.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/core/router/app_paths.dart';
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
                title: const Text('my quiz'),
              ),
              body: Column(children: [
                const WelcomeImage(),
                for (final quiz in getList<Quiz>(snapshot.data!))
                  QuizSelectArea(quiz),
              ]),
              floatingActionButton: FloatingActionButton(
                onPressed: () => context.go(Paths.create),
                child: const Icon(Icons.add),
              ),
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
