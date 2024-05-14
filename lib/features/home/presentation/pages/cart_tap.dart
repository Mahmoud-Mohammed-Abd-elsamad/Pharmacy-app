import 'package:farmacy_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/models/cart_item_model.dart';
import '../widgets/cart_item.dart';
import '../widgets/custo_button.dart';
import '../widgets/payment_details.dart';
import '../widgets/payment_methosds.dart';

class CartTap extends StatelessWidget {
  const CartTap({super.key});

  final List<CartItemModel> items = const [
    CartItemModel(false,
        image: Assets.imageTestData, name: "Panadol Gold", price: "50"),
    CartItemModel(false,
        image: Assets.imageTestData3, name: "Panadol Gold", price: "30"),
    CartItemModel(false,
        image: Assets.imageTestData, name: "Panadol Gold", price: "50"),
    CartItemModel(false,
        image: Assets.imageTestData3, name: "Panadol Gold", price: "30"),
    CartItemModel(false,
        image: Assets.imageTestData3, name: "Panadol Gold", price: "30"),
    CartItemModel(false,
        image: Assets.imageTestData, name: "Panadol Gold", price: "50"),
    CartItemModel(false,
        image: Assets.imageTestData3, name: "Panadol Gold", price: "30"),
  ];

  @override
  Widget build(BuildContext context) {
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
          height: 290,
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CartItem(
                  cartItemModel: items[index],
                );
              }),
        ),
        const PaymentDetails(
          subTotal: '',
          deliveryFees: '',
          total: '',
        ),
        const PaymentMethods(),
        SizedBox(
          height: 16,
        ),
        CustomButton(
          onPressed: () {},
          text: "Checkout",
          width: 310,
          height: 48,
          backColor: Color(0xff45A2CF),
          textColor: Colors.white,
        )
      ],
    );
  }
}
