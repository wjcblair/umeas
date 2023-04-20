import 'package:flutter/material.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_padding.dart';
import 'package:umeas/features/auth/presentation/widgets/textfields/email_text_field.dart';
import 'package:umeas/features/auth/presentation/widgets/textfields/password_text_field.dart';

class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> emailValid;
  final ValueNotifier<bool> passwordValid;

  AuthForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.emailValid,
    required this.passwordValid,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      onChanged: () {
        _key.currentState!.validate();
      },
      child: AuthPadding(
        child: Column(
          children: <Widget>[
            EmailTextField(
              context: context,
              controller: emailController,
              isValid: emailValid,
            ),
            const SizedBox(height: 8),
            PasswordTextField(
              context: context,
              controller: passwordController,
              isValid: passwordValid,
            ),
          ],
        ),
      ),
    );
  }
}
