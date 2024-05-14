import 'package:flutter/material.dart';

class SnackBarClass{
 static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> pushSnackPar(
      BuildContext context,
      {required String text}) {
    var snackBar = SnackBar(
      content: Text(text ?? " 00"),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}