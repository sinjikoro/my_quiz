import 'package:flutter/material.dart';
import 'package:my_quiz/core/enum/config.dart';
import 'package:my_quiz/core/widgets/gutter.dart';

class GradientCard extends StatelessWidget {
  const GradientCard({
    super.key,
    required this.color,
    this.width,
    this.height,
    this.child,
    this.itemSize = ItemSize.medium,
  });

  final Color color;
  final double? width;
  final double? height;
  final Widget? child;
  final ItemSize itemSize;

  @override
  Widget build(BuildContext context) {
    final defaultWidth = MediaQuery.of(context).size.width * 0.88;
    final defaultHeight = MediaQuery.of(context).size.height * 0.12;

    return Padding(
      padding: verticalPadding16,
      child: Container(
        width: width ?? defaultWidth,
        height: height ?? defaultHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //グラデーション
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color.withOpacity(0.55),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
