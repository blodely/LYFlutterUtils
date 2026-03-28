import 'package:flutter/material.dart';
import 'package:ly_flutter_utils/ly_utils.dart';

class LYShadowContainer extends StatelessWidget {
  final Widget? child;
  final Color? shadowColor;
  final double blurRadius;
  final double spreadRadius;
  final Offset offset;
  final double borderRadius;
  const LYShadowContainer({
    super.key,
    this.child,
    this.shadowColor,
    this.blurRadius = 14,
    this.spreadRadius = 7,
    this.offset = const Offset(0, 0),
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color:
                shadowColor ??
                (LYUtils.kit.isLight(context)
                    ? Colors.black.withValues(alpha: 0.14)
                    : Colors.white.withValues(alpha: 0.04)),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            offset: offset,
          ),
        ],
      ),
      child: child,
    );
  }
}
