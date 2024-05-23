import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_styles.dart';
class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    super.key, required this.icon,required this.onTap, required this.iconSize,
    required this.backgroundColor, required this.iconColor,
  });

  final  IconData icon;
  final void Function()? onTap;
  final double iconSize;
  final Color backgroundColor;
  final Color iconColor;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppStyles.secondaryColor),
        ),
        child: CircleAvatar(
          radius: 45 / 2,
          backgroundColor:backgroundColor,

          child: Icon(icon,size: iconSize,color: iconColor,),
        ),
      ),
    );
  }
}
