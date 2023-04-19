import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;

  const AuthTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
    );
  }
}
