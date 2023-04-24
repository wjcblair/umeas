import 'package:flutter/material.dart';
import 'package:umeas/core/presentation/colors/app_colors.dart';

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
        hintText: 'you@example.com',
        prefixIcon: Icon(
          Icons.email,
          color: AppColors.surfaceVariant,
        ),
      ),
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
