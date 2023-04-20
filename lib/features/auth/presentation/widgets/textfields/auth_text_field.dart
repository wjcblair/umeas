import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final Widget prefixIcon;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final String? Function(String?) validator;
  final ValueChanged<String>? onChanged;
  final ValueNotifier<bool> isValid;

  const AuthTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
    required this.prefixIcon,
    required this.validator,
    required this.onChanged,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
