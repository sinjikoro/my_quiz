import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quiz/core/models/answer.dart';
import 'package:my_quiz/features/question/provider/selected_quiz_provider.dart';
import 'package:my_quiz/features/question/widgets/answer_area.dart';
import 'package:my_quiz/features/question/widgets/answer_button.dart';
import 'package:my_quiz/features/question/widgets/question_area.dart';
import 'package:my_quiz/features/result/provider/quiz_result_provider.dart';

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
        title: Text('${quiz.title} ${quiz.description}'),
      ),
      body: Column(
        children: [
          QuestionArea(question.question),
          Row(
            children: [
              for (final answer in question.answers)
                Expanded(
                  child: AnswerArea(
                    answer: answer,
                    selectAnswer: () {
                      setState(() {
                        selectAnswer = answer;
                      });
                    },
                  ),
                ),
            ],
          ),
          Row(
            children: [
              AnswerButton(
                onPressed: () {
                  final answer = Answer(
                      answer: selectAnswer,
                      correctAnswer: question.correctAnswer,
                      isCorrect: selectAnswer == question.correctAnswer);
                  ref.read(quizResultProvider.notifier).addAnswer(answer);
                  if (isLastQuestion) {
                    context.push('/result');
                  } else {
                    setState(() {
                      id++;
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
