import 'package:flutter/material.dart';

import 'auth_text_field.dart';

class EmailTextField extends AuthTextField {
  const EmailTextField({
    Key? key,
    required TextEditingController controller,
    required String hintText,
  }) : super(
          key: key,
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          hintText: hintText,
          enableSuggestions: false,
          autocorrect: false,
        );
}
