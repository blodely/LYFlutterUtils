import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ly_flutter_utils/ly_utils.dart';

class LYGlassContainer extends StatelessWidget {
  final double? sigma;
  final double? cornerRadius;
  final double? borderWidth;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Widget? child;

  const LYGlassContainer({
    super.key,
    this.sigma,
    this.cornerRadius,
    this.borderWidth,
    this.width,
    this.height,
    this.margin,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(cornerRadius ?? 0),
      child: BackdropFilter(
        // blur bg
        filter: ImageFilter.blur(sigmaX: sigma ?? 7, sigmaY: sigma ?? 7),

        child: Container(
          width: width,
          height: height,
          margin: margin,
          decoration: BoxDecoration(
            color:
                LYUtils.kit.isLight(context)
                    ? const Color(0xfff3f3f3).withValues(alpha: 0.12)
                    : const Color(0xff3a3a3a).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(cornerRadius ?? 25),
            border: Border.all(
              color:
                  LYUtils.kit.isLight(context)
                      ? Colors.grey.withValues(alpha: 0.2)
                      : const Color(0xff5a5a5a).withValues(alpha: 0.2),
              width: borderWidth ?? 1.2,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: child,
        ),
      ),
    );
  }
}
