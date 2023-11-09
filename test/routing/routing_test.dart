import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> RoutingTest(WidgetTester tester) async {
  await tester.pumpAndSettle();

  // move create quiz page
  await tester.tap(find.byIcon(Icons.add));
  await tester.pumpAndSettle();
  expect(find.text('Create Quiz'), findsOneWidget);

  // back home
  await tester.tap(find.byIcon(Icons.arrow_back));
  await tester.pumpAndSettle();
  expect(find.text('my quiz'), findsOneWidget);

  // move create quiz page
  await tester.tap(find.text('初級'));
  await tester.pumpAndSettle();
  expect(find.text('初級 かんたんだよ'), findsOneWidget);

  // move next question
  await tester.tap(find.text('中国'));
  await tester.tap(find.text('次へ'));
  await tester.pumpAndSettle();
  expect(find.text('一番GDPの多い国は？'), findsOneWidget);

  // move next question
  await tester.tap(find.text('アメリカ'));
  await tester.tap(find.text('次へ'));
  await tester.pumpAndSettle();
  expect(find.text('一番人口の多い国は？'), findsOneWidget);

  // move next question
  await tester.tap(find.text('インド'));
  await tester.tap(find.text('次へ'));
  await tester.pumpAndSettle();
  expect(find.text('一番南に位置する国は？'), findsOneWidget);

  // move result
  await tester.tap(find.text('オーストラリア'));
  await tester.tap(find.text('次へ'));
  await tester.pumpAndSettle();
  expect(find.text('Congratulation!'), findsOneWidget);

  // back home
  await tester.tap(find.text('選択画面へ'));
  await tester.pumpAndSettle();
  expect(find.text('my quiz'), findsOneWidget);
}
