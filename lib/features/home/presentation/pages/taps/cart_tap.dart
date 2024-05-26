import 'dart:developer';

import 'package:farmacy_app/congfig/routes/routes.dart';
import 'package:farmacy_app/core/utils/widgets/custom_button.dart';
import 'package:farmacy_app/core/utils/widgets/push_snack_par.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/stripe_services.dart';


import '../../manager/payment_provider/payment_privideer.dart';
import '../../widgets/cart_item.dart';
import '../../widgets/custm_payment_button.dart';
import '../../widgets/payment_details.dart';
import '../../widgets/payment_methosds.dart';

class CartTap extends StatefulWidget {
  const CartTap({super.key});

  @override
  State<CartTap> createState() => _CartTapState();
}

class _CartTapState extends State<CartTap> {
  bool isVisaMethod = true;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isVisaMethod = false;
      log("isVisaMethod $isVisaMethod");
    } else {
      isVisaMethod = true;
      log("isVisaMethod $isVisaMethod");

    }
    setState(() {

    });
  }

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
          height: MediaQuery.of(context).size.height * (0.42), //290
          child: provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppStyles.secondaryColor,
                ))
              : items.isEmpty
                  ? Center(
                      child: Text(
                      "Your Cart is Empty",
                      style: AppStyles.medium17(context)
                          .copyWith(color: Colors.black),
                    ))
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          medicineCartModel: items[index],
                          index: index,
                        );
                      }),
        ),
        PaymentDetails(
          subTotal: provider.totalCartPrice.toString(),
          deliveryFees: '20',
          total: (provider.totalCartPrice + 20).toString(),
        ),
        //const PaymentMethods(),
        SizedBox(
          height: 16,
        ),
        CustomButton(
          onPressed: () async {
            // Navigator.pushNamed(context, Routes.paymentScreen);

           if(provider.cartItems.isEmpty){
             SnackBarClass.pushSnackPar(context, text: "Your Cart is Empty");
           }
           else{
           await  showModalBottomSheet(
                 context: context,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(16)),
                 builder: (context) {
                   return Column(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       PaymentMethods(updatePaymentMethod: updatePaymentMethod,),
                       SizedBox(height: 16,),
                       ChangeNotifierProvider(create: (BuildContext context) {
                         return PaymentProvider(StripeServices());
                       },
                         child:  Padding(
                           padding: EdgeInsets.symmetric(horizontal: 16),
                           child: CustomPaymentButton(isVisaMethod: isVisaMethod, totalPrice: provider.totalCartPrice + 20),),
                       ),
                       SizedBox(height: 16,),

                     ],
                   );
                 });

           }
          },
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
