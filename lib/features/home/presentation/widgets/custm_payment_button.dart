import 'dart:developer';

import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/api_keys.dart';


import '../../data/models/stripe_models/payment_intent_body.dart';
import '../manager/payment_provider/payment_privideer.dart';
import 'custom_button_tow.dart';

class CustomPaymentButton extends StatelessWidget {
  const CustomPaymentButton({
    super.key,
    required this.isVisaMethod, required this.totalPrice,
  });

  final bool isVisaMethod;
  final int totalPrice ;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PaymentProvider>(context, listen: false);
    return CustomButtonTow(
        onTap: () async {
          if (isVisaMethod) {
            await provider.makePayment(PaymentIntentBody(
                amount: (2356*100).toString(), currency: "USD", customerId: ApiKys.customerId));
            log("PaymentProvider FutureDelay ");
            if (provider.isPaymentSuccess) {
              log("PaymentProvider s ${provider.isPaymentSuccess} ");
              Navigator.of(context).pop();

              if (context.mounted) {
                _showDialog(context);
                var snackBar = SnackBar(
                  content: Text("payment sucess"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              // show the dialog
            } else {
              log("PaymentProvider f ${provider.isPaymentSuccess} ");
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
