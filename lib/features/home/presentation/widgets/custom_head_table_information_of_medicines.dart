import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class CustomHeadTableInformationOfMedicines extends StatelessWidget {
  const CustomHeadTableInformationOfMedicines({
    super.key,
  });

 final List<String> items = const ["Image", "Name","Price", "Quantity", "Edit", ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:List.generate(5, (index) {
          return AspectRatio(aspectRatio: 71 / 57,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(child: Text(items[index],style: AppStyles.regular16(context).copyWith(color: Colors.black),)),
            ),);
        }),
      ),
    );
  }
}
