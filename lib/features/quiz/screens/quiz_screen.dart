import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quiz/core/models/answer.dart';
import 'package:my_quiz/core/router/app_paths.dart';
import 'package:my_quiz/features/quiz/provider/quiz_result_provider.dart';
import 'package:my_quiz/features/quiz/provider/selected_quiz_provider.dart';
import 'package:my_quiz/features/quiz/widgets/answer_area.dart';
import 'package:my_quiz/features/quiz/widgets/answer_button.dart';
import 'package:my_quiz/features/quiz/widgets/question_area.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key, required this.id});

  final int id;

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends ConsumerState<QuizScreen> {
  String selectAnswer = '';
  late int id = widget.id;

  @override
  Widget build(BuildContext context) {
    final quiz = ref.watch(selectedQuizProvider);
    final question = quiz.questions.firstWhere((element) => element.id == id);
    final isLastQuestion = quiz.questions.last == question;

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleLarge,
            children: [
              TextSpan(text: '${quiz.title} '),
              TextSpan(
                text: quiz.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          QuestionArea(question.question),
          Expanded(
            child: GridView.count(
              childAspectRatio: 8 / 3,
              crossAxisCount: 2,
              children: [
                for (final answer in question.answers)
                  AnswerArea(
                    answer: answer,
                    selectAnswer: () {
                      setState(() {
                        selectAnswer = answer;
                      });
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AnswerButton(
        onPressed: () {
          final answer = Answer(
            answer: selectAnswer,
            correctAnswer: question.correctAnswer,
            isCorrect: selectAnswer == question.correctAnswer,
          );
          ref.read(quizResultProvider.notifier).addAnswer(answer);
          if (isLastQuestion) {
            context.go(Paths.result);
          } else {
            setState(() {
              id++;
            });
          }
        },
      ),
    );
  }
}
