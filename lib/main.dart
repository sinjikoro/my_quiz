import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quiz/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_quiz/core/Provider/mock/quiz_instance_mock.dart';
import 'package:my_quiz/core/Provider/quiz_instance_provider.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      overrides: [
        quizInstanceProvider.overrideWithValue(await quizInstanceMock()),
      ],
      child: MyQuiz(),
    ),
  );
}
