import 'dart:async';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:farmacy_app/features/home/presentation/widgets/custom_dot.dart';
import 'package:farmacy_app/features/home/presentation/widgets/panner_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import 'dots_indicator.dart';

class CustomPannerPageView extends StatefulWidget {
  const CustomPannerPageView({super.key});

  @override
  CustomPannerPageViewState createState() => CustomPannerPageViewState();
}

class CustomPannerPageViewState extends State<CustomPannerPageView> {
  late PageController pageController ;
  int currentIndex = 0;


  @override
  void initState() {
    super.initState();
    pageController = PageController();
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
       if(pageController.hasClients){
         pageController.animateToPage(
           currentIndex,
           duration: Duration(milliseconds: 100),
           curve: Curves.easeIn,
         );
       }
      } else {
        currentIndex = -1;
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentTabs = [
      PannerItem(image: Assets.pharmacyImage, currentPageIndex: currentIndex, ),
      PannerItem(image: Assets.pharmacyImage, currentPageIndex: currentIndex, ),
      PannerItem(image: Assets.pharmacyImage, currentPageIndex: currentIndex, ),
    ];
    return  ExpandablePageView(
      scrollDirection: Axis.horizontal,
      controller: pageController,
      onPageChanged: (int index) {
        setState(() {
          print("currentIndexB $currentIndex");
          currentIndex = index;
          print("currentIndexA $currentIndex");

        });
      },
      children: currentTabs,
    );
  }
}

