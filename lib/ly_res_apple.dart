import 'package:flutter/material.dart';

class LYResApple extends StatelessWidget {
  final Widget? child;
  final VoidCallback? ontap;
  const LYResApple({super.key, this.child, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 109,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Color(0xffa6a6a6), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
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
      letterSpacing: -0.3,
    );
  }
}

class LYResDlAppStore extends StatelessWidget {
  final VoidCallback? ontap;
  const LYResDlAppStore({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return LYResApple(
      ontap: ontap,
      child: Stack(
        children: [
          Positioned(
            top: 1,
            bottom: 1,
            left: 4,
            child: Icon(Icons.apple, color: Colors.white, size: 26),
          ),
          Positioned(
            top: 5,
            left: 30,
            child: Text('Download on the', style: LYResApple.subtitleStyle()),
          ),
          Positioned(
            bottom: 5,
            left: 30,
            child: Text('App Store', style: LYResApple.titleStyle()),
          ),
        ],
      ),
    );
  }
}
