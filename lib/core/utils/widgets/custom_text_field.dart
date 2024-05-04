import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.text, required this.controller,
  });
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 335/48,
      child: TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(
              fillColor: Color(0xffF6F2F2),
              filled: true,
              hintText: "email",
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
              ))),
    );
  }
}
