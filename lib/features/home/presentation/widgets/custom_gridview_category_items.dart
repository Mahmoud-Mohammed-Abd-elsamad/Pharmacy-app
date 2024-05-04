import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_background_container.dart';
import '../../data/models/item_model.dart';

class CustomGridViewCategoryItems extends StatelessWidget {
  const CustomGridViewCategoryItems({
    super.key,
    required this.items,
  });

  final List<SelectedCategoryItemModel> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 159 / 236,
            mainAxisSpacing: 16,
            crossAxisSpacing: 32),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomBackgroundContainer(
            horizontalPadding: 15,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                      aspectRatio: 122 / 119,
                      child: Image.asset(
                        items[index].image,
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
                          items[index].name,
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
                          items[index].price,
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
          );
        });
  }
}
