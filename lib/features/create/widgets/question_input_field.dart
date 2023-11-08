import 'package:flutter/material.dart';
import 'package:my_quiz/core/widgets/gutter.dart';

class QuestionInputField extends StatefulWidget {
  const QuestionInputField({
    super.key,
    required this.controller,
    this.lostFocusAction,
    this.headerText,
    this.hintText,
  });

  final TextEditingController controller;
  final Function(String text)? lostFocusAction;
  final String? headerText;
  final String? hintText;

  @override
  State<QuestionInputField> createState() => _QuestionInputFieldState();
}

class _QuestionInputFieldState extends State<QuestionInputField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.lostFocusAction?.call(widget.controller.text);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalMargin32,
        if (widget.headerText != null) ...[
          Text(widget.headerText!),
          horizontalMargin8,
        ],
        Flexible(
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: widget.hintText ?? '',
            ),
          ),
        ),
        horizontalMargin32,
      ],
    );
  }
}
