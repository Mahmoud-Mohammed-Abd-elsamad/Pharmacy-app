import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/features/splash_screen/presentation/pages/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
       color: AppStyles.secondaryColor,
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: SplashViewBody(),
        ),
      ),
    );
  }
}
