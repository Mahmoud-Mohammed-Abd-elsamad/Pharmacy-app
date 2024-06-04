import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild(
      {super.key, required this.hintText, required this.controller});
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // validator: validator,
      // inputFormatters: inputFormatters,
      decoration: InputDecoration(
        fillColor: const Color(0xf919090),
        filled: true,
        contentPadding: const EdgeInsets.only(left: 15),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
