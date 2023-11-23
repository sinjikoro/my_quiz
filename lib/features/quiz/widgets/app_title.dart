import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontFamily: 'Zen Maru Gothic',
          fontWeight: FontWeight.w700,
          fontSize: 24,
          letterSpacing: 3,
        ),
        children: [
          TextSpan(
            text: 'My',
            style: TextStyle(color: Colors.amber),
          ),
          TextSpan(
            text: 'Quiz',
          ),
        ],
      ),
    );
  }
}
