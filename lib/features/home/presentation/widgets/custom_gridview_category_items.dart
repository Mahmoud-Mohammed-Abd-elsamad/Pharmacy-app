import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets/custom_background_container.dart';
import '../../data/models/add_item_to_cart_body.dart';
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
  List<SelectedCategoryItemModel> items = [
    SelectedCategoryItemModel(
        medicineId: 1,
        name: 'banadol',
        description: 'fdfffd',
        price: 55,
        medicineQuantity: 2,
        categoryName: 'lllll'),
    SelectedCategoryItemModel(
        medicineId: 2,
        name: 'xxxxxx',
        description: 'fdfffd',
        price: 10,
        medicineQuantity: 2,
        categoryName: 'lllll'),
    SelectedCategoryItemModel(
        medicineId: 3,
        name: 'mmmmmmmm',
        description: 'fdfffd',
        price: 90,
        medicineQuantity: 4,
        categoryName: 'lllll'),
    SelectedCategoryItemModel(
        medicineId: 4,
        name: 'ooooo',
        description: 'fdfffd',
        price: 10,
        medicineQuantity: 3,
        categoryName: 'lllll'),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: true);
    // List<SelectedCategoryItemModel> items =
    //     context.watch<HomeProvider>().medicines;
    return
        //provider.getMedicinesSuccess
        true
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 159 / 236,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 32),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  print("items length ${items[2].name}");

                  return Card(
                    elevation: 1,
                    shadowColor: Colors.grey,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xff0FBFBFB),
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Colors.grey.withOpacity(.6)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AspectRatio(
                                aspectRatio: 122 / 119,
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
                                  autofocus: false,
                                  onPressed: () async {
                                    log("${items[index].medicineId.toString()}>>>>>>>>>>>>>");
                                    provider.selectedMedicineItemToAddToCart = index;
                                    if (provider.allAddedItemsToCartWithMedicineIdList.contains(
                                        items[index].medicineId.toString())) {
                                      provider.allAddedItemsToCartWithMedicineIdList.remove(
                                          items[index].medicineId.toString());
                                      provider.deleteCartItem(provider.allAddedItemsToCartWithCartIdList[index]);
                                      provider.allAddedItemsToCartWithCartIdList.removeAt(index);
                                      log("provider.cartItems remove ${provider.allAddedItemsToCartWithMedicineIdList.length}");
                                    } else {
                                      await provider.addItemToCart(
                                          addItemToCartBody: AddItemToCartBody(
                                              userId: "1",
                                              medicineId: items[index]
                                                  .medicineId
                                                  .toString(),
                                              itemQuantity: "5"));
                                      provider.allAddedItemsToCartWithMedicineIdList.add(
                                          items[index].medicineId.toString());
                                      log("provider.cartItems add ${provider.allAddedItemsToCartWithMedicineIdList.length}");
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: provider.allAddedItemsToCartWithMedicineIdList
                                            .contains(items[index]
                                                .medicineId
                                                .toString())
                                        ? Colors.grey
                                        : Color(0xff0194E2),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  child: provider.isLoading &&  provider.selectedMedicineItemToAddToCart == index
                                      ? SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ))
                                      : Text(
                                          provider.allAddedItemsToCartWithMedicineIdList.contains(
                                                  items[index]
                                                      .medicineId
                                                      .toString())
                                              ? "Added To Cart"
                                              : "Add To Cart",
                                          style: AppStyles.semiBold12(context),
                                        )),
                            ),
                          ]),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(
                  color: AppStyles.primaryColor,
                ),
              );
  }
}
