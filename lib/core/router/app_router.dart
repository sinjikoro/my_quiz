import 'package:go_router/go_router.dart';
import 'package:my_quiz/core/router/app_paths.dart';
import 'package:my_quiz/features/question/pages/quiz_screen.dart';
import 'package:my_quiz/features/create/pages/quiz_add_screen.dart';
import 'package:my_quiz/features/quiz_list/pages/quiz_select_screen.dart';
import 'package:my_quiz/features/result/pages/result_screen.dart';

GoRouter appRouter = GoRouter(
  initialLocation: Paths.home,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const QuizSelectScreen(),
    ),
    GoRoute(
      path: '${Paths.quiz}/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return QuizScreen(id: int.parse(id!));
      },
    ),
    GoRoute(
      path: Paths.result,
      builder: (context, state) => const ResultScreen(),
    ),
    GoRoute(
      path: Paths.create,
      builder: (context, state) => const CreateScreen(),
    ),
  ],
);
