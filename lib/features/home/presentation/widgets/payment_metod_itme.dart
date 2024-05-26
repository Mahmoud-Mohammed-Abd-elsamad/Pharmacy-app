import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key, required this.isActive, required this.image, required this.text,
  });

  final bool isActive;
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8,),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2.5,
            color: isActive ?  AppStyles.secondaryColor : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      duration: Duration(milliseconds: 800),

      child: Row(
        children: [
          SvgPicture.asset(image),
          SizedBox(width: 8,),
          Text(text,style:  AppStyles.semiBold20(context).copyWith(color: Color(0xff3667A6)),),
        ],
      ),
    );
  }
}
