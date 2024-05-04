import 'package:flutter/cupertino.dart';

import '../app_styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4,bottom: 4),
      child: Text(title,
          style: AppStyles.bold16(context).copyWith(
            color: const Color(0xff455A64),
          )),
    );
  }
}
