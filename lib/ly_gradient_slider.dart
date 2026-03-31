import 'package:flutter/material.dart';

class LYGradientSlider extends StatelessWidget {
  // CORE PARAMETERS
  final double value;
  final ValueChanged<double> onChanged;

  // CUSTOM SHAPE
  final double height;
  final List<Color> trackColors;

  // BORDER
  final double? borderWidth;
  final Color? borderColor;

  const LYGradientSlider({
    super.key,
    required this.value,
    required this.onChanged,

    this.height = 12, // DEFAULT HEIGHT:12
    this.trackColors = const [
      Colors.green,
      Colors.green,
      Colors.amber,
      Colors.red,
      Colors.red,
    ], // DEFAULT COLOR GRADIENT FROM GREEN TO RED

    this.borderWidth = 0,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: height,
        trackShape: LYGradientTrackShape(
          borderColor: borderColor ?? Colors.grey.withValues(alpha: 0.618),
          borderWidth: borderWidth ?? 1,
          trackcolors: trackColors,
        ),
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

class LYGradientTrackShape extends RoundedRectSliderTrackShape {
  final Color borderColor;
  final double borderWidth;

  final List<Color> trackcolors;

  const LYGradientTrackShape({
    this.borderColor = Colors.grey,
    this.borderWidth = 1,

    this.trackcolors = const [Colors.green, Colors.red],
  });

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    // CUSTOM ↓

    // TRACK RECT
    final Rect trackrect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    // TRACK BORDER RECT
    final RRect trackrrect = RRect.fromRectAndRadius(
      trackrect,
      Radius.circular((trackrect.height / 2).truncateToDouble()),
    );

    // DRAW: - BORDER
    final Paint borderPaint =
        Paint()
          ..color = borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth;
    context.canvas.drawRRect(trackrrect, borderPaint);

    // CALCULATE ACTIVE WIDTH (left part)
    final double activeTrackWidth = thumbCenter.dx - trackrect.left;
    // CALCULATE INACTIVE WIDHT (right part)
    final double inactiveTrackWidth = trackrect.width - activeTrackWidth;

    // DRAW: - GRADIENT SHAPE
    final Paint gradientPaint =
        Paint()
          ..shader = LinearGradient(
            colors: trackcolors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(trackrect);
    context.canvas.drawRRect(
      RRect.fromRectAndRadius(
        trackrect,
        Radius.circular((trackrect.height / 2).truncateToDouble()),
      ),
      gradientPaint,
    );

    // DRAW: - INACTIVE SHAPE
    if (inactiveTrackWidth > 0) {
      final Paint inactivePaint =
          Paint()
            // ..color = Colors.black.withValues(alpha: 0.2);
            ..shader = LinearGradient(
              colors: trackcolors,
            ).createShader(trackrect);

      // INACTIVE RECT
      final Rect inactiveRect = Rect.fromLTWH(
        thumbCenter.dx,
        trackrect.top,
        inactiveTrackWidth,
        trackrect.height,
      );

      context.canvas.drawRRect(
        RRect.fromRectAndRadius(inactiveRect, Radius.circular(6)),
        inactivePaint,
      );
    }

    /*
    super.paint(
      context,
      offset,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      enableAnimation: enableAnimation,
      textDirection: textDirection,
      thumbCenter: thumbCenter,
      secondaryOffset: secondaryOffset,
      isDiscrete: isDiscrete,
      isEnabled: isEnabled,
      additionalActiveTrackHeight: additionalActiveTrackHeight,
    );
    */
  }

  // REMOVE "PADDING"
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
