import 'package:farmacy_app/core/utils/widgets/custom_app_bar.dart';
import 'package:farmacy_app/core/utils/widgets/push_snack_par.dart';
import 'package:farmacy_app/features/forget_password_screen/presentation/manager/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_title.dart';

class ForgetPasswordResetPasswordWidget extends StatelessWidget {
  const ForgetPasswordResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetPasswordProvider>().resetPasswordFormKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
                child: Text("Reset Password",
                    style: AppStyles.bold32(context)
                        .copyWith(color: const Color(0xff455A64)))),
            const SizedBox(
              height: 48,
            ),
            const CustomTitle(
              title: 'new password',
            ),
            CustomTextField(
                suffixIcon: const Icon(CupertinoIcons.eye_slash),
                onPressedIcon:(){
                  context.read<ForgetPasswordProvider>().changeObscure();
                },                      obscureText: context.watch<ForgetPasswordProvider>().isObscure,



                validator: (value){
                if(value!.isEmpty || value.length < 6) {
                  return "Please enter a valid password";
                }else{
                  return null;
                }
              },
              text: 'new password',
              controller: context.read<ForgetPasswordProvider>().passwordController,
            ),
            const CustomTitle(
              title: 'confirm new password',
            ),
            CustomTextField(
              suffixIcon: const Icon(CupertinoIcons.eye_slash),
              onPressedIcon:(){
                context.read<ForgetPasswordProvider>().changeObscureConfirmPasswordText();
              },                      obscureText: context.watch<ForgetPasswordProvider>().isObscureConfirmPasswordText,


              validator: (value){
                if(value != context.read<ForgetPasswordProvider>().passwordController.text) {
                  return "Password not confirm";
                }else{
                  return null;
                }
              },
              text: 'confirm new password',
              controller:  context.read<ForgetPasswordProvider>().confirmPasswordController,
            ),
            const SizedBox(
              height: 64,
            ),
            Center(
                child: CustomButton(
                  onPressed: () {
                    if(context.read<ForgetPasswordProvider>().resetPasswordFormKey.currentState!.validate()) {
                      Future.delayed(const Duration(seconds: 2),(){
                        context.read<ForgetPasswordProvider>().resetPassword();

                      });
                      if(context.read<ForgetPasswordProvider>().isResetPasswordSuccess){
                        SnackBarClass.pushSnackPar(context, text: "Password Reset Successfully");
                      }else
                        {
                          SnackBarClass.pushSnackPar(context, text: "Password Reset Failed.. invalid OTP");

                        }
                    }

                  },
                  text: "Confirm",
                  height: 48,
                  width: 320,
                  backColor: AppStyles.secondaryColor,
                )),
          ],
        ),
      ),
    );;
  }
}
