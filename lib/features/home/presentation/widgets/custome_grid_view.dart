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
  final void Function(int index)? onTap;
  final List textColors = const [
    Color(0xffb4937b),
    Color(0xff759ec9),
    Colors.white,
    Color(0xff5AA3A5),
    Colors.black,
    Color(0xffE3E0E0FF),
    Colors.white,
    Colors.black,
    Colors.white,
    Color(0xff41d0bf),
    Color(0xff5E99C0),
    Color(0xff6b98a2),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: true);
    return MasonryGridView.count(
      itemCount: context.watch<HomeProvider>().categories.length,
      crossAxisCount: 3,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        print("Index is $index");
        return InkWell(
          onTap: () async {
            onTap!(provider.categories[index].categoryId!);
            Future.delayed(const Duration(seconds: 2), () async {
              await provider.getMedicinesByCategoryId(
                  provider.categories[index].categoryId.toString());
              print("fensh call getMedicinesById");
            });
          },
          child: Stack(children: [

            Container(
              height: _getItemHeight(index: index) +
                  _getItemHeightParentContainer(index: index),
              color: items[index],
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      provider.categories[index].name.toString(),
                      style: AppStyles.semiBold17(context)
                          .copyWith(color: textColors[index]),
                    ),
                  )),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: items[index],
                // _getItemHeight(index: index),
                height: _getItemHeight(index: index),
                child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(
                      provider.categories[index].photo!,
                      fit: BoxFit.fitHeight,
                    )),
                // RotatedBox(
                //   quarterTurns: index-1,
                //   child: RichText(
                //     text: TextSpan(
                //       text: context
                //           .watch<HomeProvider>()
                //           .categories[index]
                //           .name,
                //       style: AppStyles.bold36(context),
                //     ),
                //   ),
                // ),
              ),
            ),

          ]),
        );
      },
    );
  }

  double _getItemHeight({required index}) {
    double height = 0;
    if (index == 0) {
      height = 80;
    } else if (index == 1 ||
        index == 4 ||
        index == 6 ||
        index == 8 ||
        index == 9 ||
        index == 10) {
      height = 160;
    } else {
      height = 80; // Default value if index doesn't match any specific case
    }
    return height;
  }

  double _getItemHeightParentContainer({required index}) {
    double height = 0;
    if (index == 0) {
      height = 22;
    } else if (index == 4 ||
        index == 2 ||
        index == 5 ||
        index == 6 ||
        index == 8 ||
        index == 9 ||
        index == 10) {
      height = 22;
    } else if (index == 7 || index == 11 || index == 1) {
      height = 40;
    } else if (index == 3) {
      height = 15;
    } else {
      height = 10; // Default value if index doesn't match any specific case
    }
    return height;
  }
}
