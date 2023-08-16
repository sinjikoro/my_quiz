import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_quiz/features/question/presentation/quiz_screen.dart';

class QuizListScreen extends StatelessWidget {
  const QuizListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('国旗クイズ'),
      ),
      body: Column(children: [
        SvgPicture.asset('assets/img/un.svg'),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const QuizScreen()));
          },
          child: const Text('初級'),
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(200),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const QuizScreen()));
          },
          child: const Text('中級'),
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(200),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const QuizScreen()));
          },
          child: const Text('上級'),
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(200),
          ),
        ),
      ]),
    );
  }
}
