import 'package:flutter/material.dart';

const overQuestionID = -1;

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // onPressed: () {
      //   final result = Result(answers: [
      //     Answer(
      //       answer: selectAnswer,
      //       isCorrect: selectAnswer == correctAnswer,
      //       correctAnswer: correctAnswer,
      //     )
      //   ]);
      //   if (nextIsResult) {
      //     context.push('/result');
      //   } else {
      //     context.push('/quiz/$nextQuestionID', extra: result);
      //   }
      // },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(140),
      ),
      child: const Text('次へ'),
    );
  }
}
