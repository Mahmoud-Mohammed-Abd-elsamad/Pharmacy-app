import 'package:farmacy_app/features/dash_board/presentation/widgets/custom_circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_styles.dart';

class AdminInfo extends StatelessWidget {
  const AdminInfo({
    super.key, required this.userName,
  });

  final  String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppStyles.secondaryColor),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
              radius: 45 / 2,

              child: const Icon(Icons.person,color: AppStyles.secondaryColor,)
          ),
        ),
        SizedBox(width: 8,),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, Dr/$userName",style: AppStyles.bold17(context).copyWith(color: Color(0xff29256E)),),
            Text("Welceome Back",style: AppStyles.bold12(context).copyWith(color: const Color(0xff8CB9CF))),
          ],
        ),
        Spacer(),
        CustomCircleButton(icon:FontAwesomeIcons.edit, onTap: (){}, iconSize: 21, backgroundColor: Colors.white, iconColor: AppStyles.secondaryColor,)
      ],
    );
  }
}

