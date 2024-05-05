
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,required this.onPressed, required this.text,  this.height,  this.width, this.backColor, this.textColor,
  });

  final String text;
  final Color? textColor;
  final void Function()? onPressed;
  final Color? backColor;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height ,
      width: width,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor: backColor ?? Colors.white,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.circular(15)

          ),

        ),
        onPressed: onPressed,
        child: Text(text,style: AppStyles.semiBold20(context).copyWith(color: textColor ?? Colors.white),),
      ),
    );
  }
}
