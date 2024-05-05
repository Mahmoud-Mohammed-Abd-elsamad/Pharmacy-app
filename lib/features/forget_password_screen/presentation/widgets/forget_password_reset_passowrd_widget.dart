import 'package:flutter/cupertino.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_title.dart';

class ForgetPasswordResetPasswordWidget extends StatelessWidget {
  const ForgetPasswordResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
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
            text: 'new password',
            controller: TextEditingController(),
          ),
          const CustomTitle(
            title: 'confirm new password',
          ),
          CustomTextField(
            text: 'confirm new password',
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: 64,
          ),
          Center(
              child: CustomButton(
                onPressed: () {
                },
                text: "Confirm",
                height: 48,
                width: 320,
                backColor: AppStyles.secondaryColor,
              )),
        ],
      ),
    );;
  }
}
