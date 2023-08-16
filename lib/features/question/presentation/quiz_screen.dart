import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_quiz/features/result/presentation/result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('国旗クイズ ~初級~'),
      ),
      body: Column(
        children: [
          Card(
            child: SvgPicture.asset('assets/img/philippines.svg'),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(140),
                ),
                child: const Text('チュニジア'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(140),
                ),
                child: const Text('フィリピン'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(140),
                ),
                child: const Text('ウズベキスタン'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(140),
                ),
                child: const Text('ベネズエラ'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(140),
                ),
                child: const Text('スキップ'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ResultScreen())),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(140),
                ),
                child: const Text('回答'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
