import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.text, required this.controller, this.validator,
  });
  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 335/48,
      child: TextFormField(
        validator:validator ,
          controller: controller,
          decoration: InputDecoration(
              fillColor: Color(0xffF6F2F2),
              filled: true,
              hintText: text,
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
