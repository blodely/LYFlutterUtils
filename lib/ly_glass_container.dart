import 'dart:ui';
import 'package:flutter/material.dart';

class LYGlassContainer extends StatelessWidget {
  final double? sigma;
  final double? cornerRadius;
  final double? borderWidth;
  final EdgeInsetsGeometry? margin;
  final Widget? child;

  const LYGlassContainer({
    super.key,
    this.sigma,
    this.cornerRadius,
    this.borderWidth,
    this.margin,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Theme brightness status
    bool isLight = Theme.of(context).brightness == Brightness.light;

    return ClipRRect(
      borderRadius: BorderRadius.circular(cornerRadius ?? 25),
      child: BackdropFilter(
        // blur bg
        filter: ImageFilter.blur(sigmaX: sigma ?? 7, sigmaY: sigma ?? 7),

        child: Container(
          margin: margin,
          decoration: BoxDecoration(
            color:
                isLight
                    ? Colors.grey.withValues(alpha: 0.15)
                    : const Color.fromARGB(
                      255,
                      130,
                      130,
                      130,
                    ).withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(cornerRadius ?? 25),
            border: Border.all(
              color:
                  isLight
                      ? Colors.grey.withValues(alpha: 0.2)
                      : const Color.fromARGB(
                        255,
                        130,
                        130,
                        130,
                      ).withValues(alpha: 0.2),
              width: borderWidth ?? 1.2,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
