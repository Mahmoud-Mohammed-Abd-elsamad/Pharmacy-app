import 'dart:developer';

import 'package:farmacy_app/congfig/routes/routes.dart';
import 'package:farmacy_app/features/home/data/data_sources/cart_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/categories_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/medicien_data_source.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../pages/dash_baord_cmedicines_screen.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: true);
    var items = provider.categories;
    return provider.isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: AppStyles.secondaryColor,
            ),
          )
        : ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () async {
                    await provider.getMedicinesByCategoryId(
                        items[index].categoryId.toString());
                    provider.selectedMedicineNameForDashBoard =
                        items[index].name!;

                    if (provider.getMedicinesSuccess && context.mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                  create: (BuildContext context) {
                                    return HomeProvider(
                                        categoriesDataSource:
                                            RemoteCategoriesDataSource(),
                                        medicineDataSource:
                                            RemoteMedicineDataSource(),
                                        cartDataSource: RemoteCartDataSource());
                                  },
                                  child: DashBoardMedicinesScreen(items: provider.medicines, selectedCategory: items[index],
                                  ))));
                    }
                  },
                  child: AspectRatio(
                    aspectRatio: 341 / 57,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffECF2FF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                          child: Text(
                        items[index].name!,
                        style: AppStyles.semiBold16(context)
                            .copyWith(color: Colors.black),
                      )),
                    ),
                  ),
                ),
              );
            });
  }


}
