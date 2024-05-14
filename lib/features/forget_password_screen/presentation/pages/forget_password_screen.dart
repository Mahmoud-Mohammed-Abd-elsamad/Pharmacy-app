import 'package:farmacy_app/core/utils/assets.dart';
import 'package:farmacy_app/core/utils/widgets/custom_button.dart';
import 'package:farmacy_app/features/forget_password_screen/presentation/manager/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_title.dart';
import '../../../../core/utils/widgets/push_snack_par.dart';
import '../widgets/forget_password_reset_passowrd_widget.dart';
import '../widgets/forget_password_verification_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ForgetPasswordProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: provider.showVerificationCode
          ? const ForgetPasswordVerificationWidget()
          : provider.showResetPassword
              ? const ForgetPasswordResetPasswordWidget()
              : _forgetPasswordMainBody(context),
    );
  }

  Widget _forgetPasswordMainBody(BuildContext context) {
    var provider = Provider.of<ForgetPasswordProvider>(context, listen: true);

    return Form(
      key: provider.forgetPasswordFormKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Center(
              child: SvgPicture.asset(Assets.lookImage),
            ),
            const SizedBox(
              height: 32,
            ),
            Center(
                child: Text("Forgot Password",
                    style: AppStyles.bold32(context)
                        .copyWith(color: const Color(0xff455A64)))),
            const SizedBox(
              height: 48,
            ),
            const CustomTitle(
              title: 'email',
            ),
            CustomTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter email';
                } else {
                  return null;
                }
              },
              text: 'email address',
              controller: provider.emailController,
            ),
            const SizedBox(
              height: 64,
            ),
            Center(
                child: CustomButton(
              onPressed: () async {
                if (provider.forgetPasswordFormKey.currentState!.validate()) {
                  var result = await provider.forgetPassword();

                  if (provider.isOtpSendSuccess) {
                    provider.showVerificationCode = true;
                    setState(() {

                    });
                    if (context.mounted) {
                      SnackBarClass.pushSnackPar(context,
                          text: "check your email for verification code");
                    }
                  }if (!provider.isOtpSendSuccess) {
                    if (context.mounted) {
                      SnackBarClass.pushSnackPar(context,
                          text: "Invalid email");
                    }
                  }

                }

              },
              text: "Continue",
              height: 48,
              width: 320,
              backColor: AppStyles.secondaryColor,
            )),
          ],
        ),
      ),
    );
  }
}
