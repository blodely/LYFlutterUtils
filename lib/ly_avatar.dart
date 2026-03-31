import 'package:flutter/material.dart';
import 'package:ly_flutter_utils/ly_utils.dart';

class LYAvatar extends StatelessWidget {
  final Widget? child;
  final VoidCallback? ontap;

  final double? borderWidth;
  final Color? borderColor;
  final double? borderRadius;

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const LYAvatar({
    super.key,
    this.child,
    this.ontap,

    this.borderWidth = 0,
    this.borderColor,
    this.borderRadius = 0,

    this.width = 100,
    this.height = 100,
    this.margin = const EdgeInsets.only(),
    this.padding = const EdgeInsets.only(),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(
            width: borderWidth!,
            color:
                borderColor ??
                LYUtilsColor.matchedColor(context).withValues(alpha: 0.618),
          ),
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: child,
      ),
    );
  }
}
