import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quiz/core/router/app_paths.dart';

class SettingQuiz extends StatefulWidget {
  const SettingQuiz({super.key});

  @override
  State<SettingQuiz> createState() => _SettingQuizState();
}

class _SettingQuizState extends State<SettingQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingQuiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.push(Paths.createQuiz),
              child: const Text('Create Quiz'),
            ),
            ElevatedButton(
              onPressed: () => context.push(Paths.maintenanceQuiz),
              child: const Text('Maintenance Quizs'),
            ),
          ],
        ),
      ),
    );
  }
}
