import 'package:flutter/material.dart';
import 'package:ly_flutter_utils/ly_utils.dart';

class PageControl extends StatelessWidget {
  const PageControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LYTitleBar(title: 'Control'),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: LYDotPaperBackground(),
    );
  }
}
