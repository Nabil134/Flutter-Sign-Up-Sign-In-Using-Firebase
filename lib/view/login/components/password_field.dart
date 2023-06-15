import 'package:flutter/material.dart';

class UserPasswordTextField extends StatelessWidget {
  const UserPasswordTextField({
    required this.userpassHintText,
    required this.userpassHintTextColor,
    required this.userPassTextFieldsuffixIcon,
    required this.userPassTextFieldsuffixIconColor,
    required this.controller,
    super.key,
  });
  final String userpassHintText;
  final Color userpassHintTextColor;
  final IconData userPassTextFieldsuffixIcon;
  final Color userPassTextFieldsuffixIconColor;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: controller,
      decoration: InputDecoration(
        hintText: userpassHintText,
        hintStyle: TextStyle(
          color: userpassHintTextColor,
        ),
        fillColor: Color(0xffF8F9FA),
        filled: true,
        suffixIcon: Icon(
          userPassTextFieldsuffixIcon,
          color: userPassTextFieldsuffixIconColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE4E7EB)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE4E7EB)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
