import 'package:flutter_test/flutter_test.dart';

Future<void> answerQuizTest(WidgetTester tester) async {
  await tester.pumpAndSettle();

  // move create quiz page
  await tester.tap(find.text('初級'));
  await tester.pumpAndSettle();
  expect(find.text('初級 かんたんだよ'), findsOneWidget);
}
