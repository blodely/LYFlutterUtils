import 'package:flutter/material.dart';
import 'package:ly_flutter_utils/ly_utils.dart';

class PageCell extends StatelessWidget {
  const PageCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LYTitleBar(title: ''),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: LYDotPaperBackground(
        child: GridView.builder(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: LYUtils.kit.safeTop(context) + 80,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemCount: 2,
          itemBuilder: (BuildContext ctx, int idx) {
            return LYPlaceholder();
          },
        ),
      ),
    );
  }
}
