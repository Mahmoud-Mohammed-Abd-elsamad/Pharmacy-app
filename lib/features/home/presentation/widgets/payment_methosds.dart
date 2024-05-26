import 'package:farmacy_app/features/home/presentation/widgets/payment_metod_itme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../data/models/payment_item_method_model.dart';

class PaymentMethods extends StatefulWidget {
   PaymentMethods({
    super.key,required this.updatePaymentMethod,
  });

   final void Function({required int index}) updatePaymentMethod;
  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int activeIndex = 0 ;
  List items = [
    PaymentItemMethodModel(name: 'cash', image: Assets.cashIcon),
    PaymentItemMethodModel(name: 'visa', image: Assets.visaIcon),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8,left: 8,top: 8),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("  Payment Method",style:  AppStyles.semiBold20(context).copyWith(color: Colors.black),),
            SizedBox(height: 12,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:List.generate(2, (index){
                  return InkWell(
                       onTap: () {
                    activeIndex = index;
                    setState(() {});
                    widget.updatePaymentMethod(index: activeIndex);
                  },
                      child:  PaymentMethodItem(isActive: activeIndex == index, image: items[index].image , text:items[index].name,));
                })
            )
          ],
        ),
      ),
    );
  }
}

