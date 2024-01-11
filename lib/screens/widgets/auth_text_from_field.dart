import 'package:flutter/material.dart';

import '../../servises/themes.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  String hintText;
  final Function validator;
  final TextInputType textInputType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? inputColor;


  AuthTextFromField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.hintText,
    required this.textInputType,
    this.prefixIcon,this.inputColor,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: AUTHTEXTFORMFIELDCOLOR,
        style: TextStyle(color: inputColor ?? PARAGRAPH.withOpacity(.8)),
        keyboardType: textInputType,
        validator: (value) => validator(value),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: inputColor ?? DISABLED,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.grey[100], // Adjust the color value here
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AUTHTEXTFORMFIELDCOLOR,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );

  }
}