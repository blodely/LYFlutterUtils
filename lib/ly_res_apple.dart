import 'package:flutter/material.dart';

class LYResApple extends StatelessWidget {
  final Widget? child;
  const LYResApple({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 109,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Color(0xffa6a6a6), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  static TextStyle titleStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'SF Pro',
      letterSpacing: -1,
    );
  }

  static TextStyle subtitleStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 8,
      fontWeight: FontWeight.bold,
      fontFamily: 'SF Compact',
      letterSpacing: 0.1,
    );
  }
}

class LYResDlAppStore extends StatelessWidget {
  final Widget? child;
  const LYResDlAppStore({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return LYResApple(
      child: Row(
        children: [
          SizedBox(width: 4),
          Icon(Icons.apple, color: Colors.white, size: 26),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: -3,
            children: [
              Text('Download on the', style: LYResApple.subtitleStyle()),
              Text('App Store', style: LYResApple.titleStyle()),
            ],
          ),
        ],
      ),
    );
  }
}
