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
    this.onTap,
  });

  final Color color;
  final double? width;
  final double? height;
  final Widget? child;
  final ItemSize itemSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final defaultWidth = MediaQuery.of(context).size.width * 0.88;
    final defaultHeight = switch (itemSize) {
      ItemSize.small => MediaQuery.of(context).size.height * 0.12,
      ItemSize.medium => MediaQuery.of(context).size.height * 0.15,
      ItemSize.large => MediaQuery.of(context).size.height * 0.18,
    };
    final padding = switch (itemSize) {
      ItemSize.small => allPadding8,
      ItemSize.medium => allPadding16,
      ItemSize.large => allPadding24,
    };

    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
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
      ),
    );
  }
}
