import 'package:flutter/material.dart';

class CustomBackgroundContainer extends StatelessWidget {
  const CustomBackgroundContainer({
    super.key,
    required this.child,
    this.horizontalPadding, this.verticalPadding,
  });

  final Widget child;
  final double? horizontalPadding;
  final double? verticalPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: horizontalPadding ?? 12, vertical: verticalPadding ?? 12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: child,
    );
  }
}
