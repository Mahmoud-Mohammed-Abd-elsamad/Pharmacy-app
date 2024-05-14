import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customAddAbstractCircleIcon(
    {required IconData icon,
    required double radius,
    required Color backgroundColor,
    Color? iconColor,
    required void Function() onPressed}) {
  return CircleAvatar(
    radius: radius,
    backgroundColor: backgroundColor,
    child: Center(
      child: IconButton(
        padding: EdgeInsets.only(bottom:icon == Icons.minimize ?  22 :0),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
          size: 19,
        ),
      ),
    ),
  );
}
