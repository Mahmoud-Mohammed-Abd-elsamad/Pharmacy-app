import 'package:flutter/cupertino.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';

class MoreTap extends StatelessWidget {
  const MoreTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomAppBarA(title: 'Profilre Name', backgroundColor: AppStyles.primaryColor,),
        Center(child: Text("profile Tap")),
      ],
    );;
  }
}