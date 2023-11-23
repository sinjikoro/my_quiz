import 'package:go_router/go_router.dart';
import 'package:my_quiz/core/router/app_paths.dart';
import 'package:my_quiz/features/quiz/pages/quiz_screen.dart';
import 'package:my_quiz/features/quiz/pages/quiz_select_screen.dart';
import 'package:my_quiz/features/quiz/pages/result_screen.dart';
import 'package:my_quiz/features/settings/pages/create_quiz_screen.dart';
import 'package:my_quiz/features/settings/pages/setting_screen.dart';

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
      path: Paths.createQuiz,
      builder: (context, state) => const CreateQuizScreen(),
    ),
    GoRoute(
      path: Paths.setting,
      builder: (context, state) => const SettingQuiz(),
      routes: [
        GoRoute(
          path: Paths.maintenanceQuiz,
          builder: (context, state) => const SettingQuiz(),
        ),
      ],
    ),
  ],
);
