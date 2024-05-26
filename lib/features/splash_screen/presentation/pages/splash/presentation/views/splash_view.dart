import 'package:farmacy_app/features/splash_screen/presentation/pages/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                //transform: GradientRotation(m),
                colors: [
              Color.fromARGB(255, 159, 207, 245),
              Colors.white,
              Color.fromARGB(255, 159, 207, 245),
            ])),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: SplashViewBody(),
        ),
      ),
    );
  }
}
