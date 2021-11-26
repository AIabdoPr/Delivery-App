import 'package:flutter/material.dart';

class CustomEditTextView extends StatelessWidget {
  String? hintText;
  IconData? icon;
  bool isPassword;
  TextEditingController? controller;
  Color color, hintColor;

  CustomEditTextView({
    this.hintText,
    this.icon,
    this.isPassword = false,
    this.controller,
    this.color = Colors.white,
    this.hintColor = const Color(0XAAFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: TextField(
        obscureText: isPassword,
        enableSuggestions: !isPassword,
        autocorrect: !isPassword,
        controller: controller,
        style: TextStyle(color: color, fontSize: 16),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: hintColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: color,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor, fontSize: 13),
          prefixIconConstraints:
              const BoxConstraints.tightFor(width: 40, height: 15),
          prefixIcon: icon != null ? Icon(icon, color: color, size: 20) : null,
        ),
      ),
    );
  }
}
