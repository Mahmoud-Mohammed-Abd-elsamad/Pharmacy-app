import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CustomButtonTow extends StatelessWidget {
  const CustomButtonTow({
    super.key,
    this.onTap,
    required this.text,
    this.isLoading = false,
  });

  final void Function()? onTap;

  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: const Color(0xff45A2CF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
              height: 20,
              width: 20,
              child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
              : Text(
            text,
            textAlign: TextAlign.center,
            style: AppStyles.semiBold20(context).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
