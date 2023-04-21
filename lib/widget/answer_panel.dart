import 'package:flutter/material.dart';

class AnswerPanel extends StatelessWidget {
  const AnswerPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: ((context, index) => ListTile(
            title: Text('ans $index'),
          )),
    );
  }
}
