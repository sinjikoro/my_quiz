import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  const GradientCard({super.key, this.width, this.height, required this.color});

  final double? width;
  final double? height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final defaultWidth = MediaQuery.of(context).size.width * 0.88;
    final defaultHeight = MediaQuery.of(context).size.height * 0.12;

    return Container(
      width: width ?? defaultWidth,
      height: height ?? defaultHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.5),
            color.withOpacity(0.55),
          ],
        ),
      ),
    );
  }
}
