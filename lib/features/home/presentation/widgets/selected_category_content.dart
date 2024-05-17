import 'package:farmacy_app/core/utils/assets.dart';
import 'package:farmacy_app/core/utils/widgets/custom_background_container.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/models/item_model.dart';
import 'custom_gridview_category_items.dart';
import 'custom_search_text_field.dart';

class SelectedCategoryContent extends StatelessWidget {
  SelectedCategoryContent({
    super.key, required this.catId,
  });

  final String catId;
  // List<SelectedCategoryItemModel> items = [
  //   SelectedCategoryItemModel(image: Assets.imageTestData, name: "P55anadol", price: 55),
  //   SelectedCategoryItemModel(image: Assets.imageTestData3, name: "P55anadol", price: 23),
  //   SelectedCategoryItemModel(image: Assets.imageTestData, name: "P55anadol", price: 55),
  //   SelectedCategoryItemModel(image: Assets.imageTestData3, name: "P55anadol", price: 23),SelectedCategoryItemModel(image: Assets.imageTestData, name: "P55anadol", price: 55),
  //   SelectedCategoryItemModel(image: Assets.imageTestData3, name: "P55anadol", price: 23),
  //
  // ];

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Expanded(
          child: Container(
          color: AppStyles.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [

                AspectRatio(
                  aspectRatio: 350/45,
                  child: CustomSearchTextField(emailController: emailController, text: 'Search',),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: CustomGridViewSelectedCategoryItems(),
                )
              ],
            ),
          ),
                ),
        ),]
    );
  }
}


