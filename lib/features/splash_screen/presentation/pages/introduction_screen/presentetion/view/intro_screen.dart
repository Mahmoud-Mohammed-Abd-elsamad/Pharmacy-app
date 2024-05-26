import 'package:farmacy_app/features/splash_screen/presentation/pages/introduction_screen/presentetion/view/widgets/intro_screen_body.dart';
import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreenBody(),
    );
  }
}
