import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_quiz/app.dart';
import 'package:my_quiz/core/Provider/mock/quiz_instance_mock.dart';
import 'package:my_quiz/core/Provider/quiz_instance_provider.dart';

import 'routing/routing_test.dart';

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
    await RoutingTest(tester);
  });
}
