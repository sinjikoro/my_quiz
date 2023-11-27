import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:my_quiz/core/Provider/quiz_instance_provider.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/core/router/app_paths.dart';
import 'package:my_quiz/features/quiz/widgets/app_title.dart';
import 'package:my_quiz/features/quiz/widgets/error_page.dart';
import 'package:my_quiz/features/quiz/widgets/gradient_card.dart';
import 'package:my_quiz/features/quiz/widgets/loading_page.dart';
import 'package:my_quiz/features/quiz/widgets/quiz_select_area.dart';

class QuizSelectScreen extends ConsumerStatefulWidget {
  const QuizSelectScreen({super.key});

  @override
  QuizSelectScreenState createState() => QuizSelectScreenState();
}

class QuizSelectScreenState extends ConsumerState<QuizSelectScreen> {
  @override
  Widget build(BuildContext context) {
    final quizInstance = ref.read(quizInstanceProvider);

    return StreamBuilder<QuerySnapshot>(
      stream: quizInstance.snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const LoadingPage();
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              debugPrint(snapshot.error.toString());
              return const ErrorPage();
            }

            return QuizSelectPage(
              snapshot: snapshot.data as QuerySnapshot<Quiz>?,
            );
        }
      },
    );
  }
}

class QuizSelectPage extends StatelessWidget {
  const QuizSelectPage({super.key, required this.snapshot});

  final QuerySnapshot<Quiz>? snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        centerTitle: true,
        title: const AppTitle(),
        actions: [
          IconButton(
            onPressed: () => context.push(Paths.setting),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      //Body
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TOPイメージ
              GradientCard(
                color: const Color(0xBC39D29F),
                child: Row(
                  children: [
                    Lottie.asset('assets/animation/BouncingSquare.json'),
                    const Text(
                      'Let\'s Play!',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // quiz list
              for (final quiz in getList<Quiz>(snapshot!)) QuizSelectArea(quiz),
            ],
          ),
        ),
      ),
    );
  }

  List<T> getList<T>(QuerySnapshot snapshot) {
    final list = <T>[];
    for (final e in snapshot.docs) {
      list.add(e.data() as T);
    }
    return list;
  }
}
