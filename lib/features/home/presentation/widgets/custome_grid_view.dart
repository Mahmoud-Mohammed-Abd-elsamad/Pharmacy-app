import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomeGridView extends StatelessWidget {
  const CustomeGridView({
    super.key,
    required this.items,
    required this.medicineCategories, this.onTap,
  });

  final List items;
  final List<String> medicineCategories;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: 16,
      crossAxisCount: 3,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        print("Index is $index");
        return InkWell(
          onTap:onTap,
          child: Container(
            color: items[index],
            height: (index == 0) ? 150 : (index == 1) ? 240 : (index == 2) ? 150: (index == 3) ? 150 : (index == 4) ? 240 : (index == 5) ? 240  : (index == 6) ? 240: (index == 7) ? 150: (index == 8) ? 240: (index == 9) ? 240: (index == 10) ? 150:240,
            child: RotatedBox(
              quarterTurns: index,
              child: RichText(
                text: TextSpan(
                  text: medicineCategories[index],
                  style: AppStyles.bold17(context),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}