import 'dart:developer';

import 'package:farmacy_app/core/utils/widgets/custom_button.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/models/add_item_to_cart_model.dart';
import '../../data/models/cart_item_model.dart';
import '../widgets/cart_item.dart';
import '../widgets/custo_button.dart';
import '../widgets/payment_details.dart';
import '../widgets/payment_methosds.dart';

class CartTap extends StatefulWidget {
  const CartTap({super.key});

  @override
  State<CartTap> createState() => _CartTapState();
}

class _CartTapState extends State<CartTap> {
  @override
  void initState() {
    var provider = Provider.of<HomeProvider>(context, listen: false);
    provider.getAllCartItemsByUserId(userId: "1");

    super.initState();
  }

  // List<AddItemToCartModel> items = [];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: true);
    var items = provider.cartItems;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 16),
          child: Center(
            child: Text("Order Details",
                style: AppStyles.bold32(context)
                    .copyWith(color: Color(0xff29256E))),
          ),
        ),
        SizedBox(
          height: 190, //290
          child: provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppStyles.secondaryColor,
                ))
              : items.isEmpty
                  ?  Center(child: Text("Your Cart is Empty",style: AppStyles.medium17(context).copyWith(color: Colors.black),))
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          addItemToCartModel: items[index],
                          index: index,
                        );
                      }),
        ),
        PaymentDetails(
          subTotal: provider.totalCartPrice.toString(),
          deliveryFees: '20',
          total: (provider.totalCartPrice + 20).toString(),
        ),
        // const PaymentMethods(),
        // SizedBox(
        //   height: 16,
        // ),
        // CustomButton(
        //   onPressed: () {},
        //   text: "Checkout",
        //   width: 310,
        //   height: 48,
        //   backColor: Color(0xff45A2CF),
        //   textColor: Colors.white,
        // )
      ],
    );
  }
}
