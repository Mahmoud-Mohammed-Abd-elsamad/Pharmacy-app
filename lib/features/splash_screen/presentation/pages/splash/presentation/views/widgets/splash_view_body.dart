import 'package:farmacy_app/features/splash_screen/presentation/pages/splash/presentation/views/widgets/sliding_animate_image.dart';
import 'package:flutter/material.dart';

import '../../../../introduction_screen/presentetion/view/intro_screen.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        slidingAinmateImage(slidingAnimation: slidingAnimation),

        //Image.asset(AssetsData.logo),
        // slidingAnimateText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(Duration(seconds: 6), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => IntroductionScreen()),
      );
    });
  }
}
