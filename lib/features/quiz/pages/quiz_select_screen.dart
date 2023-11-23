import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quiz/core/Provider/quiz_instance_provider.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/core/router/app_paths.dart';
import 'package:my_quiz/features/quiz/widgets/quiz_select_area.dart';
import 'package:my_quiz/features/quiz/widgets/welcome_image.dart';

class QuizSelectScreen extends ConsumerStatefulWidget {
  const QuizSelectScreen({super.key});

  @override
  QuizSelectScreenState createState() => QuizSelectScreenState();
}

class QuizSelectScreenState extends ConsumerState<QuizSelectScreen> {
  @override
  Widget build(BuildContext context) {
    final quizInstance = ref.read(quizInstanceProvider);

    return FutureBuilder(
      future: quizInstance.get(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return loadingWidget();
          case ConnectionState.done:
            if (snapshot.hasError) {
              debugPrint(snapshot.error.toString());
              return errorWidget();
            }

            return Scaffold(
              appBar: AppBar(
                title: const Text('my quiz'),
                actions: [
                  IconButton(
                    onPressed: () => context.push(Paths.setting),
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
              body: Column(
                children: [
                  // TOPイメージ
                  const WelcomeImage(),
                  // quiz list
                  for (final quiz in getList<Quiz>(snapshot.data!))
                    QuizSelectArea(quiz),
                ],
              ),
            );
        }
      },
    );
  }

  List<T> getList<T>(QuerySnapshot snapshot) {
    final list = <T>[];
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
