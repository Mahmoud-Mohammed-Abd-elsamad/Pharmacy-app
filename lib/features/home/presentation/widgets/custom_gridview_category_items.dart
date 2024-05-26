import 'dart:developer';

import 'package:farmacy_app/features/login_screen/presentation/manager/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets/custom_background_container.dart';
import '../../data/models/add_item_to_cart_body.dart';
import '../../data/models/item_model.dart';
import '../manager/home_provider/provider.dart';
import 'custom_gridview_card_item_selected_categgory_content.dart';

class CustomGridViewSelectedCategoryItems extends StatefulWidget {
  CustomGridViewSelectedCategoryItems({
    super.key,
  });

  @override
  State<CustomGridViewSelectedCategoryItems> createState() =>
      _CustomGridViewSelectedCategoryItemsState();
}

class _CustomGridViewSelectedCategoryItemsState
    extends State<CustomGridViewSelectedCategoryItems> {

  @override
  Widget build(BuildContext context) {
    List<SelectedCategoryItemModel> items =
        context.watch<HomeProvider>().medicines;
    return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 152 / 236,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 32),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  print("items length ${items[2].name}");

                  return CustomGridViewCardSelectedCategoryContent(items: items, index: index,);
                });
  }
}
