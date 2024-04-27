import 'package:flutter/cupertino.dart';

import '../../../../core/utils/app_styles.dart';

class SelectedCategoryContent extends StatelessWidget {
  const SelectedCategoryContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,width: double.infinity,
      child: Container(
        color: AppStyles.primaryColor,
      ),
    );
  }
}
