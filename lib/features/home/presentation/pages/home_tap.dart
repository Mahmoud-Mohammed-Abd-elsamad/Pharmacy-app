import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/features/home/presentation/widgets/custom_panner_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/custom_background_container.dart';
import '../widgets/custome_grid_view.dart';
import '../widgets/home_tap_body.dart';
import '../widgets/selected_category_content.dart';


class HomeTap extends StatefulWidget {
  HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  final List items = [
    Colors.pink,Colors.yellow,Colors.green,Colors.blue,Colors.pink,Colors.grey,Colors.green,Colors.blue,
    Colors.pink,Colors.yellow,Colors.green,Colors.blue,Colors.green,Colors.yellow,Colors.green,
    Colors.pink,Colors.yellow,Colors.green,Colors.blue,Colors.pink,Colors.yellow,Colors.green,
    Colors.pink,Colors.yellow,Colors.green,Colors.blue,Colors.pink,Colors.yellow,Colors.green,

  ];

  final List<String> medicineCategories = [
    "Hair Care",
    "Skin Care",
    "Diet",
    "Pain Relief",
    "Vitamins & Supplements",
    "Allergy & Sinus",
    "Digestive Health",
    "First Aid",
    "Eye Care",
    "Oral Care",
    "First Aid",
    "Allergy & Sinus",
    "Digestive Health",
    "Allergy & Sinus",
    "Digestive Health",
    "First Aid",
  ];

  bool  selectedCategory = false;

  void Function()? onTap(){
    setState(() {
      selectedCategory = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("selectedCategory $selectedCategory  >>");
    return selectedCategory ? SelectedCategoryContent() : CustomScrollView(
      slivers: [

        SliverToBoxAdapter(
          child: CustomAppBar(title: 'Pharmacy Name', backgroundColor: AppStyles.primaryColor,),
        ),
        SliverToBoxAdapter(
          child: CustomPannerPageView(),
        ),
        HomeTapBody(items: items, medicineCategories: medicineCategories, onTap: onTap,)
      ],
    );
  }
}


