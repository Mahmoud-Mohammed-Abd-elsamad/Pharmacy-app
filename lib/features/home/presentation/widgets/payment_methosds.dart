import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    super.key,
  });

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
                children:List.generate(3, (index){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.visaIcon),
                        SizedBox(width: 8,),
                        Text("visa",style:  AppStyles.semiBold20(context).copyWith(color: Color(0xff3667A6)),),
                      ],
                    ),
                  );
                })
            )
          ],
        ),
      ),
    );
  }
}
