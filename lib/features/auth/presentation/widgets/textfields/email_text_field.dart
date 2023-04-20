import 'package:flutter/material.dart';

import 'auth_text_field.dart';

class EmailTextField extends AuthTextField {
  EmailTextField({
    Key? key,
    required BuildContext context,
    required TextEditingController controller,
    required ValueNotifier<bool> isValid,
  }) : super(
          key: key,
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          hintText: 'Email',
          prefixIcon: const Icon(Icons.email),
          enableSuggestions: false,
          autocorrect: false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            } else {
              if (!isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            }
          },
          onChanged: (value) {
            isValid.value = isEmailValid(value);
          },
          isValid: isValid,
        );

  static bool isEmailValid(String? email) {
    if (email == null) return false;
    String emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }
}
