import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import 'custom_dot.dart';
import 'dots_indicator.dart';

class PannerItem extends StatelessWidget {
  const PannerItem({
    super.key, required this.image, required this.currentPageIndex,
  });

  final String image;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 420 / 215,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: ShapeDecoration(
              image:  DecorationImage(
                fit: BoxFit.fill, image: AssetImage(image),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Align(

                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: DotsIndicator(currentPageIndex:currentPageIndex ,),
                )))));
  }
}