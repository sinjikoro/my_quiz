import 'package:go_router/go_router.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/core/models/result.dart';
import 'package:my_quiz/features/question/pages/quiz_screen.dart';
import 'package:my_quiz/features/quiz_select/pages/quiz_list_screen.dart';
import 'package:my_quiz/features/result/pages/result_screen.dart';

GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const QuizListScreen(),
    ),
    GoRoute(
      path: '/quiz/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return QuizScreen(id: int.parse(id!));
      },
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) => ResultScreen(
        quiz: state.extra as Quiz,
        result: state.extra as Result,
      ),
    ),
  ],
);
