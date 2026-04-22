import 'package:flutter/material.dart';

class LYLine extends StatelessWidget {
  final Color? color;
  final bool horizontal;
  const LYLine({super.key, this.color = Colors.black, this.horizontal = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: horizontal ? null : 1,
      height: horizontal ? 1 : null,
      decoration: BoxDecoration(color: color),
    );
  }
}

class LYVerticalLine extends StatelessWidget {
  final Color? color;
  const LYVerticalLine({super.key, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LYLine(color: color, horizontal: false);
  }
}

class LYHorizontalLine extends StatelessWidget {
  final Color? color;
  const LYHorizontalLine({super.key, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LYLine(color: color, horizontal: true);
  }
}
