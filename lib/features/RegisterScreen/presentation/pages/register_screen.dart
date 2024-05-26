import 'package:farmacy_app/features/RegisterScreen/presentation/manager/provider/register_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../congfig/routes/routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_title.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RegisterProvider>(context, listen: true);
    return Scaffold(
      body: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 45,),

              Center(
                child: Container(
                  child: Text("Register", style: AppStyles.bold36(context)),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              const CustomTitle(
                title: 'user name',
              ),
              CustomTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter user name';
                  }
                  return null;
                },
                text: 'user name',
                controller: provider.userNameController,
              ),
              SizedBox(height: 16,),
              const CustomTitle(
                title: 'phone number',
              ),
              CustomTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter user phone began with 1';
                  }
                  return null;
                },
                text: 'phone number',
                controller: provider.phoneController,
              ),
              SizedBox(height: 16,),

              const CustomTitle(
                title: 'email',
              ),
              CustomTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
                text: 'email',
                controller: provider.emailController,
              ),
              SizedBox(height: 16,),
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
                  }
                  return null;
                },
                obscureText: context.watch<RegisterProvider>().isObscure,
                text: 'password',
                controller: provider.passController,
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                  child: CustomButton(isLoading: provider.showLoading,
                onPressed: () async{
                  if (provider.formKey.currentState!.validate()) {
                   await provider.registerUser();
                    if(provider.registerSuccess && context.mounted){
                      pushSnackPar(context, text: provider.registerSuccessMessage!);
                      Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
                    }else if(!provider.registerSuccess && context.mounted){
                      pushSnackPar(context, text: provider.registerFailureMessage! + "please try again");
                    }
                  }
                },
                text:  "Register",
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
                      style: AppStyles.bold16(context),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.loginScreen, (route) => false);
                        },
                        child: Text(
                          "login",
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

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> pushSnackPar(
      BuildContext context,
      {required String text}) {
    var snackBar = SnackBar(
      content: Text(text ?? " 00"),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
