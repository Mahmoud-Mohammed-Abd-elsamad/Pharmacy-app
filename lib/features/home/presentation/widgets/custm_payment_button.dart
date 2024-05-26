import 'dart:developer';

import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/api_keys.dart';

import '../../data/models/stripe_models/payment_intent_body.dart';
import '../manager/payment_provider/payment_privideer.dart';
import 'custom_button_tow.dart';

class CustomPaymentButton extends StatefulWidget {
  const CustomPaymentButton({
    super.key,
    required this.isVisaMethod,
    required this.totalPrice,
  });

  final bool isVisaMethod;
  final int totalPrice;

  @override
  State<CustomPaymentButton> createState() => _CustomPaymentButtonState();
}

class _CustomPaymentButtonState extends State<CustomPaymentButton> {
  @override
  Widget build(BuildContext context) {
    log("isVisaMethod the value was sent ${widget.isVisaMethod}");
    var paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
    var homeProvider = Provider.of<HomeProvider>(context, listen: true);
    return CustomButtonTow(
        onTap: () async {
          if (widget.isVisaMethod) {
            await paymentProvider.makePayment(PaymentIntentBody(
                amount: (widget.totalPrice * 100).toString(),
                currency: "USD",
                customerId: ApiKys.customerId));
            log("PaymentProvider FutureDelay ${paymentProvider.isPaymentSuccess} ");
            if (paymentProvider.isPaymentSuccess) {
              log("PaymentProvider FutureDelay2 ${paymentProvider.isPaymentSuccess} ");
              log("PaymentProvider FutureDelay3 ${homeProvider.cartItems} ");
              var list = homeProvider.cartItems.map((e) async {
                log("PaymentProvider FutureDelay3 ${paymentProvider.isPaymentSuccess} ");

                await homeProvider.deleteCartItem(e.cartItemId.toString());
                homeProvider.cartItems.clear();
                homeProvider.allAddedItemsToCartWithMedicineIdList.clear();
                homeProvider.allAddedItemsToCartWithCartIdList.clear();
              }).toList();
              await homeProvider.getAllCartItemsByUserId(userId: "1");

              log("allAddedItemsToCartWithCartIdList ${homeProvider.allAddedItemsToCartWithCartIdList.length} ");


              Navigator.of(context).pop();

              if (context.mounted) {
                _showDialog(context);
                var snackBar = SnackBar(
                  content: Text("payment sucess"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                setState(() {
                  log("setSatete called ========================");
;                });
              } // show the dialog
            } else {
              Navigator.of(context).pop();
              var snackBar = const SnackBar(
                content: Text("payment not completed"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          } else {
            Navigator.of(context).pop();
            var snackBar = const SnackBar(
              content: Text("your order has been placed "),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        isLoading: context.watch<PaymentProvider>().isLoading,
        text: 'Continue');
  }

  _showDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFEEF3FF),
              child: Icon(
                Icons.check,
                size: 50,
                color: Color(0xff407CE2),
              )),
          SizedBox(
            height: 22,
          ),
          Text(
            "Payment Success",
            style: AppStyles.bold25(context).copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Your payment has",
            style: AppStyles.regular17(context),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "been successful",
            style: AppStyles.regular17(context),
          ),
        ],
      ),
    );
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
