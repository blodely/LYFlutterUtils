import 'package:flutter/material.dart';
import 'package:ly_flutter_utils/ly_utils.dart';

class LYBorderedContainer extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final double? borderWidth;
  final bool? clip;
  final Widget? child;
  const LYBorderedContainer({
    super.key,
    this.margin,
    this.padding,
    this.radius,
    this.borderWidth,
    this.clip,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      clipBehavior: clip != null && clip! ? Clip.antiAlias : Clip.none,
      decoration: BoxDecoration(
        border: Border.all(
          color:
              LYUtils.kit.isLight(context)
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.black.withValues(alpha: 0.2),
          width: borderWidth ?? 0,
        ),
        borderRadius: BorderRadius.circular(radius ?? 0),
        color: Colors.transparent,
      ),
      child: child,
    );
  }
}
