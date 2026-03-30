import 'package:flutter/material.dart';

class LYPlaceholder extends StatelessWidget {
  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;
  final double? width;
  final double? height;
  const LYPlaceholder({
    super.key,
    this.marginTop,
    this.marginBottom,
    this.marginLeft,
    this.marginRight,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      margin: EdgeInsets.only(
        top: marginTop ?? 0,
        right: marginRight ?? 0,
        bottom: marginBottom ?? 0,
        left: marginLeft ?? 0,
      ),
      padding: EdgeInsets.only(
        top: paddingTop ?? 0,
        right: paddingRight ?? 0,
        bottom: paddingBottom ?? 0,
        left: paddingLeft ?? 0,
      ),
      width: width,
      height: height,
      child: Placeholder(),
    );
  }
}
