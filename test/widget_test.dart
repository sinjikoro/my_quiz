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

void main() {
  testWidgets('Create quiz', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyQuiz()));

    // move create quiz page
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('Create Quiz'), findsOneWidget);

    // input quiz title
    await tester.enterText(find.byKey(const Key('title')), 'test title');
    await tester.pumpAndSettle();
    expect(find.text('test title'), findsOneWidget);

    // input quiz description
    await tester.enterText(
        find.byKey(const Key('description')), 'test description');
    await tester.pumpAndSettle();
    expect(find.text('test description'), findsOneWidget);

    // input quiz question
    await tester.enterText(find.byKey(const Key('question')), 'test question');
    await tester.pumpAndSettle();
    expect(find.text('test question'), findsOneWidget);

    // input quiz answer
    await tester.enterText(find.byKey(const Key('answer')), 'test answer');
    await tester.pumpAndSettle();
    expect(find.text('test answer'), findsOneWidget);

    // add quiz
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
  });
}
