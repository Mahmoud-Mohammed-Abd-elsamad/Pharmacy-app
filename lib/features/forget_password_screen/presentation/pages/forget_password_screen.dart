import 'package:farmacy_app/core/utils/assets.dart';
import 'package:farmacy_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_title.dart';
import '../widgets/forget_password_reset_passowrd_widget.dart';
import '../widgets/forget_password_verification_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isVerificationCode = false;
  bool isResetPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isVerificationCode
          ? ForgetPasswordVerificationWidget(
              ontTape: ontTape,
            )
          : isResetPassword
              ? const ForgetPasswordResetPasswordWidget()
              : _forgetPasswordMainBody(context),
    );
  }

  void ontTape() {
    setState(() {
      isVerificationCode = false;
      isResetPassword = true;
    });
  }

  Padding _forgetPasswordMainBody(BuildContext context) {
    return Padding(
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
            text: 'email address',
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: 64,
          ),
          Center(
              child: CustomButton(
            onPressed: () {
              setState(() {
                isVerificationCode = true;
                isResetPassword = false;
              });
            },
            text: "Continue",
            height: 48,
            width: 320,
            backColor: AppStyles.secondaryColor,
          )),
        ],
      ),
    );
  }
}
