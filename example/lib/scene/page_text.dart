import 'package:flutter/material.dart';
import 'package:ly_flutter_utils/ly_dot_paper_background.dart';
import 'package:ly_flutter_utils/ly_title_bar.dart';

class PageText extends StatelessWidget {
  const PageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LYTitleBar(title: 'Text'),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: LYDotPaperBackground(),
    );
  }
}
