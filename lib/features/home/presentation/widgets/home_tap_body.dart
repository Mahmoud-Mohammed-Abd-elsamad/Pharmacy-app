import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_background_container.dart';
import '../manager/home_provider/provider.dart';
import 'custome_grid_view.dart';

class HomeTapBody extends StatelessWidget {
  const HomeTapBody({
    super.key,
    required this.items,
    required this.medicineCategories,
    required this.onTap,
  });

  final List items;
  final List<String> medicineCategories;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomBackgroundContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                "Shop By Category",
                style:
                    AppStyles.medium17(context).copyWith(color: Colors.black),
              ),
              context.watch<HomeProvider>().getCategoriesSuccess
                  ? SizedBox(
                      height: 1600, // Adjust the height as needed
                      child: CustomeGridView(
                        items: items,
                        medicineCategories: medicineCategories,
                        onTap: onTap,
                      ))
                  : Column(children: [
                      SizedBox(
                        height: 110,
                      ),
                      Center(
                          child: CircularProgressIndicator(
                        color: AppStyles.primaryColor,
                      )),
                    ])
            ],
          ),
        ),
      ),
    );
  }
}
