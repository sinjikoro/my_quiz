import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('国旗クイズ ~初級~'),
      ),
      body: Column(children: [
        const Text('Congratulation!'),
        const Text('99点'),
        const Text('''
間違えた問題のこたえ
  1. チュニジア
  2. マケドニア
  3. ベネズエラ
'''),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(140),
              ),
              child: const Text('もう一度'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(140),
              ),
              child: const Text('選択画面へ'),
            ),
          ],
        ),
      ]),
    );
  }
}
