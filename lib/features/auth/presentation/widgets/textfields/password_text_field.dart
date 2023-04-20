import 'package:flutter/material.dart';

import 'auth_text_field.dart';

class PasswordTextField extends AuthTextField {
  PasswordTextField({
    Key? key,
    required BuildContext context,
    required TextEditingController controller,
    required ValueNotifier<bool> isValid,
  }) : super(
          key: key,
          controller: controller,
          keyboardType: TextInputType.visiblePassword,
          hintText: 'Password',
          prefixIcon: const Icon(Icons.lock),
          enableSuggestions: false,
          autocorrect: false,
          obscureText: true,
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
            isValid.value = isPasswordValid(value);
          },
          isValid: isValid,
        );

  static bool isPasswordValid(String? password) {
    if (password == null) return false;
    // TODO: Add some advanced password checks (uppercase/lowercase, at least 1 number, ...)
    return password.length >= 6;
  }
}
