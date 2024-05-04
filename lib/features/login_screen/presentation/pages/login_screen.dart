import 'package:farmacy_app/congfig/routes/routes.dart';
import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_title.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

 bool  _switchValue = false;
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                child: Text("Login", style: AppStyles.bold36(context)),
              ),
            ),
            Spacer(flex: 1,),
            const CustomTitle(title: 'email',),
            CustomTextField(text: 'email', controller: TextEditingController(),),
            const CustomTitle(title: 'password',),
            CustomTextField(text: 'password', controller: TextEditingController(),),
            const SizedBox(height: 18,),
            Row(
              children: [
                CupertinoSwitch(
                  thumbColor:widget._switchValue ? Colors.white : Colors.grey,
                  activeColor: const Color(0xff407CE2),

                  value:widget. _switchValue,
                  onChanged: (value) {
                    setState(() {
                      widget._switchValue = value;
                    });
                  },
                ),Text("Remember me",style: AppStyles.regular14(context),),
                Spacer(),Text("Forgot password?",style: AppStyles.regular14(context),),
              ],
            ),
            const SizedBox(height: 32,),
            Center(child: CustomButton(onPressed: (){}, text: "Login",height: 48,width: 320,backColor: AppStyles.secondaryColor,)),
            const SizedBox(height: 24,),
           Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account? ",style: AppStyles.regular14(context),),
                  InkWell(
                      onTap: (){
                        Navigator.pushNamedAndRemoveUntil(context, Routes.registerScreen, (route) => false);
                      },
                      child: Text("Signup",style: AppStyles.regular14(context).copyWith(color: AppStyles.secondaryColor),)),
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


