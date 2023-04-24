import 'package:flutter/material.dart';

import '../../../../../core/presentation/colors/app_colors.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final ValueNotifier<bool> isValid;

  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.isValid,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.all(12),
        enabledBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            //color: Colors.black,
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
          borderSide: BorderSide(
            //color: Colors.blue,
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
        filled: true,
        hintText: 'Your password',
        prefixIcon: Icon(
          Icons.lock,
          color: AppColors.surfaceVariant,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordVisibility,
        ),
        //labelStyle: TextStyle(fontSize: 13.0),
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
    // TODo: Add some advanced password checks (uppercase/lowercase, at least 1 number, ...)
    return password.length >= 6;
  }
}
