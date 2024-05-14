import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.controller,
    this.validator, this.suffixIcon, this.obscureText, this.onPressedIcon,
  });

  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon? suffixIcon;
  final bool? obscureText;
  final void Function()? onPressedIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 335 / 48,
      child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.obscureText ?? false,
          decoration: InputDecoration(
            fillColor: Color(0xffF3F3F3),
            filled: true,
            hintText: widget.text,
            suffixIcon: IconButton(
              onPressed: widget.onPressedIcon,
              icon: widget.suffixIcon ??
                  const SizedBox(
                    height: 0,
                    width: 0,
                  ),
            ),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
          )),
    );
  }
}
