import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../core/utils/widgets/custom_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            const CustomTitle(title: 'email',),
            CustomTextField(text: 'email', controller: TextEditingController(),)
          ],
        ),
      ),
    );
  }
}


