import 'package:flutter/cupertino.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';

class CartTap extends StatelessWidget {
  const CartTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomAppBar(title: 'cart Name', backgroundColor: AppStyles.primaryColor,),
        Center(child: Text("cartTap")),
      ],
    );
  }
}