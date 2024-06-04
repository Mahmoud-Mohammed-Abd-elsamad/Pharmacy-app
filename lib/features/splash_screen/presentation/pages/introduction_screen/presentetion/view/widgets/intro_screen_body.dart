import 'package:farmacy_app/congfig/routes/routes.dart';
import 'package:farmacy_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';


class IntroScreenBody extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  // void _onIntroEnd(context) {
  //   // Navigate to your home page or any other route when the intro is finished.
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (_) => const MyTaple()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      //descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Find your medicine Easly",
          body:
              "The application  collects most of the medications on the market in addition to all the information about them ",
          image: Image.asset(Assets.oneintrosplash),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Your order will deliver to your door",
          body:
              "It's easy to find pharmacy that is near to your location. With just one tap.",
          image: Image.asset(Assets.twointrosplash),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Ask our chatboot what You Want",
          body:
              "you can  integrate with a  sophisticated chatbot .you enter your symptoms and it tells you where to go",
          image: Image.asset(Assets.threeintrosplash),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => {
        Navigator.pushNamed(context, Routes.loginScreen),
      },
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
