import 'package:flutter/material.dart';
import 'package:my_quiz/core/models/answer.dart';
import 'package:my_quiz/core/models/quiz.dart';
import 'package:my_quiz/core/models/result.dart';
import 'package:my_quiz/features/question/widgets/answer_area.dart';
import 'package:my_quiz/features/question/widgets/question_area.dart';
import 'package:my_quiz/features/result/pages/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.quiz});

  final Quiz quiz;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _currentId = 0;

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[_currentId];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.quiz.title} ${widget.quiz.description}'),
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
                        quiz: widget.quiz,
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
