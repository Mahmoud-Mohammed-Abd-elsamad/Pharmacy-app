import 'package:farmacy_app/features/home/presentation/widgets/custom_panner_page_view.dart';
import 'package:flutter/cupertino.dart';


class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomPannerPageView(),
      ],
    );
  }
}
