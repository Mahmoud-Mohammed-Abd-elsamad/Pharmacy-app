import 'package:farmacy_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class slidingAinmateImage extends StatelessWidget {
  const slidingAinmateImage({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Image.asset(Assets.logo),
          );
        });
  }
}
