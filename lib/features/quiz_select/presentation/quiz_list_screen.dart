import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_quiz/features/question/presentation/quiz_screen.dart';

enum QuizLevel { easy, normal, hard }
class QuizListScreen extends StatefulWidget {
  const QuizListScreen({super.key});

  @override
  State<QuizListScreen> createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('国旗クイズ'),
      ),
      body: Column(children: [
        SvgPicture.asset('assets/img/un.svg'),
        // SegmentedButton<QuizLevel>(
        //   segments: const <ButtonSegment<QuizLevel>>[
        //     ButtonSegment<QuizLevel>(
        //       label: Text('初級'),
        //       value: QuizLevel.easy,
        //     ),
        //     ButtonSegment<QuizLevel>(
        //       label: Text('中級'),
        //       value: QuizLevel.normal,
        //     ),
        //     ButtonSegment<QuizLevel>(
        //       label: Text('上級'),
        //       value: QuizLevel.hard,
        //     ),
        //   ],
        // ),
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
