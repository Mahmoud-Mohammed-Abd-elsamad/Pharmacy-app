import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class CustomeGridView extends StatelessWidget {
  const CustomeGridView({
    super.key,
    required this.items,
    required this.medicineCategories,
    this.onTap,
  });

  final List items;
  final List<String> medicineCategories;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: true);
    return MasonryGridView.count(
      itemCount: context.watch<HomeProvider>().categories.length,
      crossAxisCount: 3,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        print("Index is $index");
        return context.watch<HomeProvider>().getCategoriesSuccess
            ? InkWell(
                onTap: () async {
                  onTap!();
                  Future.delayed(const Duration(seconds: 2), ()async {
                    await provider.getMedicinesById(
                        provider.categories[index].categoryId.toString());
                    print("fensh call getMedicinesById");
                  });
                  print("_+_+__+_+__+_+_+_+_+_+_${context.read<HomeProvider>().medicines.length}");
                },
                child: Container(
                  color: items[index],
                  height: _getItemHeight(index: index),
                  child: RotatedBox(
                    quarterTurns: index,
                    child: RichText(
                      text: TextSpan(
                        text: context
                            .watch<HomeProvider>()
                            .categories[index]
                            .name,
                        style: AppStyles.bold36(context),
                      ),
                    ),
                  ),
                ),
              ):
        Align(
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(color: AppStyles.secondaryColor,));
      },
    );
  }

  double _getItemHeight({required index}) {
    double height = 0;
    if (index == 0) {
      height = 150;
    } else if (index == 1 || index == 4 || index == 5 || index == 6 || index == 8 || index == 9 || index == 10) {
      height = 240;
    } else {
      height = 150; // Default value if index doesn't match any specific case
    }
    return height;
  }
}
