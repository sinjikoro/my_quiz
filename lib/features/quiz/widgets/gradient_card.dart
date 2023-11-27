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
    final (heightSizeRate, widthSizeRate, paddingSize) =
        _getLayoutParameters(itemSize);

    final defaultHeight = MediaQuery.of(context).size.height * heightSizeRate;
    final defaultWidth = MediaQuery.of(context).size.width * widthSizeRate;

    return Padding(
      padding: paddingSize,
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

  /// レイアウトパラメータを取得する
  (double heightSizeRate, double widthSizeRate, EdgeInsets paddingSize)
      _getLayoutParameters(ItemSize itemSize) {
    switch (itemSize) {
      case ItemSize.small:
        return (0.08, 0.88, allPadding8);
      case ItemSize.medium:
        return (0.15, 0.88, allPadding16);
      case ItemSize.large:
        return (0.24, 0.88, allPadding24);
    }
  }
}
