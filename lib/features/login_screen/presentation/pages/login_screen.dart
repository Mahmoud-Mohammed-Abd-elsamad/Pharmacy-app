import 'dart:developer';

import 'package:farmacy_app/congfig/routes/routes.dart';
import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/core/utils/widgets/custom_button.dart';
import 'package:farmacy_app/core/utils/widgets/push_snack_par.dart';
import 'package:farmacy_app/features/login_screen/data/models/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_title.dart';
import '../manager/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45,
              ),
              Center(
                child: Text("Login", style: AppStyles.bold36(context)),
              ),
              Spacer(
                flex: 1,
              ),
              const CustomTitle(
                title: 'email',
              ),
              CustomTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  } else {
                    return null;
                  }
                },
                text: 'email',
                controller: provider.emailController,
              ),
              SizedBox(
                height: 16,
              ),
              const CustomTitle(
                title: 'password',
              ),
              CustomTextField(
                suffixIcon: const Icon(CupertinoIcons.eye_slash),
                onPressedIcon: () {
                  provider.changeObscure();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  } else {
                    return null;
                  }
                },
                obscureText: provider.isObscure,
                text: 'password',
                controller: provider.passController,
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  CupertinoSwitch(
                    thumbColor:
                        provider.switchValue ? Colors.white : Colors.grey,
                    activeColor: const Color(0xff407CE2),
                    value: provider.switchValue,
                    onChanged: (value) {
                      provider.switchValue = value;
                    },
                  ),
                  Text(
                    "Remember me",
                    style: AppStyles.regular14(context),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.forgetPasswordScreen);
                    },
                    child: Text(
                      "Forgot password?",
                      style: AppStyles.regular14(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                  child: CustomButton(
                isLoading: provider.showLoading,
                onPressed: () async {
                  if (provider.formKey.currentState!.validate()) {
                    await provider.loginUser();
                    log("login success  g ${provider.loginSuccess}");
                    if (provider.loginSuccess && context.mounted) {
                      log("login success  enter ${provider.loginSuccess}");
                      FocusManager.instance.primaryFocus?.unfocus();
                      provider.isAdmin
                          ? Navigator.pushNamedAndRemoveUntil(
                              context, Routes.dashBoardScreen, (route) => false)
                          : Navigator.pushNamedAndRemoveUntil(
                              context, Routes.locationScreen, (route) => false);
                      SnackBarClass.pushSnackPar(context,
                          text: "successfully logged in");
                    } else {
                      SnackBarClass.pushSnackPar(context,
                          text: "wrong email or password ..please try again");
                    }
                  }
                },
                text: "Login",
                height: 48,
                width: 320,
                backColor: AppStyles.secondaryColor,
              )),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: AppStyles.regular16(context),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.registerScreen, (route) => false);
                        },
                        child: Text(
                          "Signup",
                          style: AppStyles.bold16(context)
                              .copyWith(color: AppStyles.secondaryColor),
                        )),
                  ],
                ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
