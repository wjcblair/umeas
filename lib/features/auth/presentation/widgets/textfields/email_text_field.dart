import 'package:flutter/material.dart';

import 'auth_text_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueNotifier<bool> isValid;

  const EmailTextField({
    Key? key,
    required this.controller,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 18.0),
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          hintText: 'Email',
          prefixIcon: Icon(Icons.email),
          labelStyle: TextStyle(fontSize: 13.0)),
      obscureText: false,
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
      enableInteractiveSelection: true,
    );
  }

  static bool isEmailValid(String? email) {
    if (email == null) return false;
    String emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }
}
