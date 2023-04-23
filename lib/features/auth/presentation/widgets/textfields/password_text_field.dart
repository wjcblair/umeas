import 'package:flutter/material.dart';

import 'auth_text_field.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final ValueNotifier<bool> isValid;

  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.isValid,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 18.0),
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(),
        hintText: 'Password',
        prefixIcon: const Icon(Icons.lock),
        labelStyle: const TextStyle(fontSize: 13.0),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
      obscureText: _obscureText,
      enableSuggestions: false,
      autocorrect: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else {
          if (!isPasswordValid(value)) {
            return 'Password must be at least 6 characters long';
          }
          return null;
        }
      },
      onChanged: (value) {
        widget.isValid.value = isPasswordValid(value);
      },
      enableInteractiveSelection: false,
    );
  }

  static bool isPasswordValid(String? password) {
    if (password == null) return false;
    // TODO: Add some advanced password checks (uppercase/lowercase, at least 1 number, ...)
    return password.length >= 6;
  }
}
