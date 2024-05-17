import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets/custom_background_container.dart';
import '../../data/models/item_model.dart';
import '../manager/home_provider/provider.dart';

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
    var provider = Provider.of<HomeProvider>(context);
    List<SelectedCategoryItemModel> items =
        context.watch<HomeProvider>().medicines;
    return provider.getMedicinesSuccess ?  GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 159 / 236,
            mainAxisSpacing: 16,
            crossAxisSpacing: 32),
        itemCount: items.length,
        itemBuilder: (context, index) {
          print("items length ${items[2].name}");

          return Container(
            color: Colors.yellow,
            child: CustomBackgroundContainer(
              horizontalPadding: 15,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AspectRatio(
                        aspectRatio: 122 /   119,
                        child: Image.asset(
                           Assets.imageTestData3,
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Row(
                        children: [
                          Text(
                            "sdfsdfsdfsdfdsfsdfsdfsdfdf",
                            style: AppStyles.bold12(context),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Text(
                            items[index].price.toString(),
                            style: AppStyles.regular12(context),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    AspectRatio(
                      aspectRatio: 118 / 32,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Add to cart",
                            style: AppStyles.semiBold12(context),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0194E2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          )),
                    ),
                  ]),
            ),
          );
        }) : Center(child: CircularProgressIndicator(color: Colors.white,),);
  }
}
