import 'package:flutter/material.dart';

class LYGradientSlider extends StatelessWidget {
  // CORE PARAMETERS
  final double value;
  final ValueChanged<double> onChanged;

  // CUSTOM SHAPE
  final double height;

  // BORDER
  final double? borderWidth;
  final Color? borderColor;

  const LYGradientSlider({
    super.key,
    required this.value,
    required this.onChanged,

    this.height = 12,

    this.borderWidth = 0,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: height,
        thumbColor: Colors.white,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: (height / 2).truncateToDouble() + 1,
          elevation: 0,
        ),

        // PRESSED EFFECT CONTROL
        overlayColor: Colors.transparent, // REMOVE COLOR
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Slider(value: value, onChanged: onChanged),
    );
  }
}
