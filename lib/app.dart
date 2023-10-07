import 'package:flutter/material.dart';
import 'package:my_quiz/features/quiz_select/pages/quiz_list_screen.dart';

class MyQuiz extends StatelessWidget {
  const MyQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyQuiz',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const QuizListScreen(),
    );
  }
}
