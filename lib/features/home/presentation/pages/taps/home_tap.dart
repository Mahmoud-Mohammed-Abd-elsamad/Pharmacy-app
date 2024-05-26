import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/features/home/presentation/widgets/custom_panner_page_view.dart';
import 'package:farmacy_app/features/login_screen/presentation/manager/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../../core/utils/widgets/custom_background_container.dart';
import '../../widgets/custome_grid_view.dart';
import '../../widgets/home_tap_body.dart';
import '../../widgets/selected_category_content.dart';

class HomeTap extends StatefulWidget {
  HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  final List items =const [
    Color(0xffB9B9AF),
    Color(0xffA7BAC1),
    Color(0xffA6745D),
    Color(0xffF8C689),
    Color(0xffC7DCE1),
    Color(0xff143233),
    Color(0xffDBAD7B),
    Color(0xffEAD6BD),
    Color(0xff363E42),
    Color(0xffDCD2D1),
    Color(0xffD0D1D3),
    Color(0xffDFCEA9),
  ];

  bool selectedCategory = false;
  String catId = "";

  void Function()? onTap(index) {
    setState(() {
      catId = index.toString();
      selectedCategory = true;
      print("catID $catId >>>>>>>>>>>>>>>>>>>>>>>>>");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("selectedCategory $selectedCategory  >>");
    print(
        "selectedCategory ${Provider.of<LoginProvider>(context).userInfo.fullName}  >>");

    return selectedCategory
        ? SelectedCategoryContent(
            catId: catId,
          )
        : CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomPannerPageView(),
              ),
              HomeTapBody(
                items: items,
                onTap: onTap,
              )
            ],
          );
  }
}
