import 'package:flutter/material.dart';

import '../../../../core/enums/form_type.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  void moveToRegister() {
    formKey.currentState?.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState?.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  void moveToForgotPassword() {
    formKey.currentState?.reset();
    setState(() {
      _formType = FormType.forgotPassword;
    });
  }

  void moveToVerifyEmail() {
    formKey.currentState?.reset();
    setState(() {
      _formType = FormType.forgotPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
