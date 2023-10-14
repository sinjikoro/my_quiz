import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quiz/core/models/answer.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/core/models/result.dart';
import 'package:my_quiz/features/question/widgets/answer_area.dart';
import 'package:my_quiz/features/question/widgets/question_area.dart';
import 'package:my_quiz/features/result/pages/result_screen.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key, required this.quiz, required this.id});

  final int id;
  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final question = quiz.questions.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${quiz.title} ${quiz.description}'),
      ),
      body: Column(
        children: [
          QuestionArea(question.question),
          Row(
            children: [
              for (final answer in question.answers)
                Expanded(
                  child: AnswerArea(answer),
                ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  final result = Result(answers: [
                    Answer(
                      answer: question.answers[0],
                      isCorrect: true,
                      correctAnswer: question.correctAnswer,
                    )
                  ]);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ResultScreen(
                        quiz: quiz,
                        result: result,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(140),
                ),
                child: const Text('次へ'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
