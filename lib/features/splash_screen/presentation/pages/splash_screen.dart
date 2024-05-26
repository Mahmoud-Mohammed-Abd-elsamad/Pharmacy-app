import 'package:farmacy_app/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../congfig/routes/routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset(Assets.doctorOrPatientImage)),
          Text(
            "welcome to our pharmacy app",
            style: AppStyles.extraBold24(context),
          ),
          Text(
            "login as",
            style: AppStyles.extraBold24(context),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Flexible(
                  child: SizedBox(
                width: 32,
              )),
              CustomButton(
                width: 311,
                height: 48,
                backColor:AppStyles.secondaryColor,

                onPressed: () {

                  Navigator.pushNamed(context, Routes.loginScreen);

                },
                text: 'Admin',
              ),
              const Flexible(
                  child: SizedBox(
                width: 10,
              )),
            ],
          ),
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                  child: SizedBox(
                    width: 32,
                  )),
              CustomButton(
                width: 311,
                height: 48,
                backColor:AppStyles.secondaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.loginScreen);
                },
                text: 'User',
              ),
              const Flexible(
                  child: SizedBox(
                    width: 10,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
