import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../login_screen/presentation/manager/provider.dart';
import '../../data/models/add_item_to_cart_body.dart';
import '../../data/models/item_model.dart';
import '../../data/models/stripe_models/payment_intent_model.dart';
import '../manager/home_provider/provider.dart';

class CustomGridViewCardSelectedCategoryContent extends StatelessWidget {
  const CustomGridViewCardSelectedCategoryContent({super.key, required this.items, required this.index});
  final List<SelectedCategoryItemModel> items;
  final int index ;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: true);

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      color: Colors.transparent,
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
                    aspectRatio: 122 / 110,
                    child: Stack(
                        children: [
                          const Positioned(
                            right: 0,
                            left: 0,
                            bottom: 0,
                            top: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(child: SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(color: AppStyles.secondaryColor,strokeWidth: 3,))),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0,
                            child: Image.network(
                              items[index].photo.toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ]
                    )),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          items[index].name.toString(),
                          style: AppStyles.bold12(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                        items[index].price.toString() + " EGP",
                        style: AppStyles.regular16(context),
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
                                  itemQuantity: "1"));
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
                      child: provider.addToCartLoading &&  provider.selectedMedicineItemToAddToCart == index
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
  }
}
