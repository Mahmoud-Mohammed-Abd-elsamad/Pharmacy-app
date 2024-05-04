import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../congfig/routes/routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_title.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                child: Text("Register", style: AppStyles.bold36(context)),
              ),
            ),
            Spacer(flex: 1,),
            const CustomTitle(title: 'user name',),
            CustomTextField(text: 'user name', controller: TextEditingController(),),
            const CustomTitle(title: 'email',),
            CustomTextField(text: 'email', controller: TextEditingController(),),
            const CustomTitle(title: 'password',),
            CustomTextField(text: 'password', controller: TextEditingController(),),
            const SizedBox(height: 18,),
            const SizedBox(height: 32,),
            Center(child: CustomButton(onPressed: (){}, text: "Register",height: 48,width: 320,backColor: AppStyles.secondaryColor,)),
            const SizedBox(height: 24,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account? ",style: AppStyles.regular14(context),),
                  InkWell(
                      onTap: (){
                        Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
                      },
                      child: Text("login",style: AppStyles.regular14(context).copyWith(color: AppStyles.secondaryColor),)),
                ],
              ),
            ),
            const Spacer(flex: 2,),

          ],
        ),
      ),
    );
  }
}
