import 'package:flutter/material.dart';

import 'auth_text_field.dart';

class PasswordTextField extends AuthTextField {
  const PasswordTextField({
    Key? key,
    required TextEditingController controller,
    required String hintText,
  }) : super(
          key: key,
          controller: controller,
          keyboardType: TextInputType.visiblePassword,
          hintText: hintText,
          enableSuggestions: false,
          autocorrect: false,
          obscureText: true,
        );
}
