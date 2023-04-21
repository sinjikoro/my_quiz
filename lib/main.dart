import 'package:flutter/material.dart';
import 'package:my_quiz/screen/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyQuiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizScreen(),
    );
  }
}
