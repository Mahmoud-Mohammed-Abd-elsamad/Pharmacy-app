import 'dart:developer';

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
    required this.onTap,
  });

  final List items;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: true);
    log("provider.isLoading = ${provider.isLoading}");
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
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Shop By Category",
                  style:
                      AppStyles.bold25(context).copyWith(color: Colors.black),
                ),
              ),
              provider.getCategoriesLoading
                  ? Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .22,
                      ),
                      Center(
                          child: CircularProgressIndicator(
                        color: AppStyles.secondaryColor,
                      )),
                    ])
                  : SizedBox(
                      height: 650, // Adjust the height as needed
                      child: CustomeGridView(
                        items: items,
                        onTap: onTap,
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
