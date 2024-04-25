import 'dart:ui';

import 'package:farmacy_app/core/utils/size_config.dart';
import 'package:flutter/cupertino.dart';

abstract class AppStyles {

  static const Color primaryColor = Color(0xff80B2CA);

  static TextStyle medium16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle regular17(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bold16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle semiBold17(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle regular16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF455A64),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bold17(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle regular14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF292D32),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle semiBold20(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF6A6A6A),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bold12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle regular12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle semiBold23(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, fontSize: 23),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF455A64),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle medium17(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFCFCFC),
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle medium24(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF6A6A6A),
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle bold25(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF455A64),
      fontSize: getResponsiveFontSize(context, fontSize: 25),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bold36(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF5C6E77),
      fontSize: getResponsiveFontSize(context, fontSize: 36),
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle extraBold24(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF1E1E1E),
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle bold32(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      fontFamily: 'Poppins ',
      fontWeight: FontWeight.w700,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
