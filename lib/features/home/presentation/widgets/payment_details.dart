import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({
    super.key, required this.subTotal, required this.deliveryFees, required this.total,
  });

  final String subTotal;
  final String deliveryFees;
  final String total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8,left: 8),
      child: AspectRatio(
        aspectRatio: 310/130,
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(.4)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("payment Details",
                    style:
                        AppStyles.semiBold20(context).copyWith(color: Colors.black)),
                SizedBox(height: 16,),
                _buildPaymentItem(
                    rText: '78 EGP',
                    lText: 'subtotal',
                    style:
                        AppStyles.semiBold17(context).copyWith(color: Colors.grey.withOpacity(.8))),
                const SizedBox(height: 8,),
                _buildPaymentItem(
                    rText: '15 EGP ',
                    lText: 'Delivery Fees',
                    style:
                        AppStyles.semiBold17(context).copyWith(color: Colors.grey.withOpacity(.8))),
                Divider(height: 16,color: Colors.grey,),
                _buildPaymentItem(
                    rText: '93 EGP',
                    lText: 'Total',
                    style:
                    AppStyles.semiBold17(context).copyWith(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildPaymentItem(
      {required String rText,
      required String lText,
      required TextStyle style}) {
    return Row(
      children: [
        Text(lText, style: style),
        Spacer(),
        Text(rText, style: style),
      ],
    );
  }
}
