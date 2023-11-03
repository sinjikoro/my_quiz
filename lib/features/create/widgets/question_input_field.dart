import 'package:flutter/material.dart';
import 'package:my_quiz/core/widgets/gutter.dart';

class QuestionInputField extends StatelessWidget {
  const QuestionInputField({
    super.key,
    required this.controller,
    this.headerText,
    this.hintText,
  });

  final TextEditingController controller;
  final String? headerText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalMargin32,
        if (headerText != null) ...[
          Text(headerText!),
          horizontalMargin8,
        ],
        Flexible(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText ?? '',
            ),
          ),
        ),
        horizontalMargin32,
      ],
    );
  }
}
