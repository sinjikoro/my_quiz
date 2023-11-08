// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_quiz/app.dart';
import 'package:my_quiz/core/Provider/mock/quiz_instance_mock.dart';
import 'package:my_quiz/core/Provider/quiz_instance_provider.dart';

import 'routing/answer_quiz_test.dart';
import 'routing/create_quiz_test.dart';

void main() {
  late ProviderScope app;

  setUpAll(() async {
    app = ProviderScope(
      overrides: [
        quizInstanceProvider.overrideWithValue(await quizInstanceMock()),
      ],
      child: const MyQuiz(),
    );
  });

  testWidgets('routing', (tester) async {
    await tester.pumpWidget(app);
    await createQuizTest(tester);

    // move to quiz_select_screen
    await tester.pumpWidget(app);
    await answerQuizTest(tester);
  });
}
