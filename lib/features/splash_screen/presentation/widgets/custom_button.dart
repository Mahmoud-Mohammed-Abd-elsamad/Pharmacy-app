import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,required this.onPressed, required this.text,
  });

  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(8.0)

          ),

        ),
        onPressed: onPressed,
        child: Text(text,style: AppStyles.semiBold23(context),),
      ),
    );
  }
}
