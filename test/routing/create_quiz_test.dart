import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> createQuizTest(WidgetTester tester) async {
  await tester.pumpAndSettle();

  // move create quiz page
  await tester.tap(find.byIcon(Icons.add));
  await tester.pumpAndSettle();
  expect(find.text('Create Quiz'), findsOneWidget);

  await tester.tap(find.byIcon(Icons.arrow_back));
}
