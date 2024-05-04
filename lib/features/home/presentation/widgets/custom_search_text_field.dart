import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.emailController, required this.text,
  });

  final TextEditingController emailController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: emailController,
        decoration: InputDecoration(
            fillColor: Color(0xffF6F2F2),
            filled: true,
            hintText: text,
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(25),
            )));
  }
}
