import 'dart:developer';
import 'package:farmacy_app/features/home/data/models/cart_item_model.dart';
import 'package:farmacy_app/features/home/data/models/update_cart_item_model.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../data/models/add_item_to_cart_model.dart';
import '../../data/models/get_all_cart_items_model.dart';
import 'custo_button.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    required this.medicineCartModel, required this.index,
  });

  final MedicineCartModel medicineCartModel;
  final int index;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    var provider =  Provider.of<HomeProvider>(context,listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
      child: Card(
        elevation: 1,
        shadowColor: Colors.grey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          height: 120,
          decoration: BoxDecoration(
            color: Color(0xff0FBFBFB),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(.6)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                  //addItemToCartModel.image
                  widget.medicineCartModel.medicinePhoto.toString(),
                  height: 70,
                  width: 70),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
              widget.medicineCartModel.medicineName.toString().length>10?
                      widget.medicineCartModel.medicineName.toString().substring(0,9):widget.medicineCartModel.medicineName.toString().substring(0,widget.medicineCartModel.medicineName.toString().length-1),
                  //    overflow: TextOverflow.clip,
                      style: AppStyles.semiBold20(context)
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      widget.medicineCartModel.medicinePrice.toString() + "EGP",

                      style: AppStyles.semiBold20(context)
                          .copyWith(color: Color(0xff58ACD4)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customAddAbstractCircleIcon(
                          icon: Icons.minimize,
                          backgroundColor: Colors.grey,
                          iconColor: Colors.black,
                          radius: 15,
                          onPressed: () async{
                            if (widget.medicineCartModel.itemQuantity! > 1) {

                              widget.medicineCartModel.itemQuantity =
                                  widget.medicineCartModel.itemQuantity! - 1;
                            await  provider.updateCartItem(
                                  UpdateCartItemModel(
                                      cartItemId:
                                      widget.medicineCartModel.cartItemId,
                                      userId: widget.medicineCartModel.userId,
                                      medicineId:
                                      widget.medicineCartModel.medicineId,
                                      itemQuantity: widget
                                          .medicineCartModel.itemQuantity));
                            provider.totalCartPrice = provider.totalCartPrice! - widget.medicineCartModel.medicinePrice!;
                            log("provider.totalCartPrice new = ${provider.totalCartPrice}");
                              setState(() {});
                            }
                          }),
                      SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        height: 30,
                        width: 15,
                        child: Text(
                          widget.medicineCartModel.itemQuantity.toString(),
                          style: AppStyles.bold25(context)
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      customAddAbstractCircleIcon(
                          icon: Icons.add,
                          backgroundColor: Color(0xff407CE2),
                          iconColor: Colors.white,
                          radius: 15,
                          onPressed: () async{
                            if (widget.medicineCartModel.itemQuantity! < widget.medicineCartModel.medicineQuantity!) {

                              widget.medicineCartModel.itemQuantity =
                                  widget.medicineCartModel.itemQuantity! + 1;
                            await  provider.updateCartItem(
                                  UpdateCartItemModel(
                                      cartItemId:
                                      widget.medicineCartModel.cartItemId,
                                      userId: widget.medicineCartModel.userId,
                                      medicineId:
                                      widget.medicineCartModel.medicineId,
                                      itemQuantity: widget
                                          .medicineCartModel.itemQuantity));

                              setState(() {
                                log(" ${provider.totalCartPrice} + addd new = ${widget.medicineCartModel.medicinePrice}");
                                provider.totalCartPrice = provider.totalCartPrice + widget.medicineCartModel.medicinePrice!;
                                log("provider.totalCartPrice new = ${provider.totalCartPrice}");
                                log(" set state new = ${provider.totalCartPrice}");
                              });
                            }
                          })
                    ],
                  ),
                ],
              ),
               Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: ()async {
                    provider.cartItems.removeAt(widget.index);

                    await provider.deleteCartItem(widget.medicineCartModel.cartItemId.toString());
                    setState(() {

                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(
                      CupertinoIcons.delete,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
