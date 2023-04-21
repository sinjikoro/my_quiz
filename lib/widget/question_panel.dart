import 'package:flutter/material.dart';

class QuestionPanel extends StatelessWidget {
  const QuestionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text(
          'Q1',
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: Text('what is it?'),
        )
      ]),
    );
  }
}
