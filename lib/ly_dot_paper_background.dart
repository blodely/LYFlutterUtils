import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LYDotPaperBackground extends StatelessWidget {
  const LYDotPaperBackground({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    Color bgColor = isLight ? Color(0xfff1f3f4) : Color(0xff202124);
    Color dotColor = isLight ? Color(0xffcccccc) : Color(0xff666666);
    double spacing = 20;
    double radius = 1.5;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        image: DecorationImage(
          image: LYDotPatternImgProv(
            color: dotColor,
            spacing: spacing,
            radius: radius,
          ),
          repeat: ImageRepeat.repeat,
          alignment: Alignment.topLeft,
        ),
      ),
    );
  }
}

class LYDotPatternImgProv extends ImageProvider<LYDotPatternImgProv> {
  final Color color;
  final double spacing;
  final double radius;

  const LYDotPatternImgProv({
    required this.color,
    required this.spacing,
    required this.radius,
  });

  @override
  Future<LYDotPatternImgProv> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<LYDotPatternImgProv>(this);
  }

  @override
  ImageStreamCompleter loadImage(
    LYDotPatternImgProv key,
    ImageDecoderCallback decode,
  ) {
    return OneFrameImageStreamCompleter(_loadAsync(key));
  }

  Future<ImageInfo> _loadAsync(LYDotPatternImgProv key) async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint()..color = key.color;

    // final size = Size(key.spacing, key.spacing);

    canvas.drawCircle(
      Offset(key.spacing / 2, key.spacing / 2),
      key.radius,
      paint,
    );

    final picture = recorder.endRecording();

    final image = await picture.toImage(
      key.spacing.toInt(),
      key.spacing.toInt(),
    );

    return ImageInfo(image: image, scale: 1.0);
  }
}
