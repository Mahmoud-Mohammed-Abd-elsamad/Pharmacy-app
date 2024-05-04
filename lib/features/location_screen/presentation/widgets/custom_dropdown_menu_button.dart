import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class CustomDropdownMenuButton extends StatelessWidget {
  const CustomDropdownMenuButton({
    super.key, required this.text,required this.onTap,
  });

  final String text;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
              angle: -1.5708,
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 12,
              )),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: AppStyles.medium17(context)
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
