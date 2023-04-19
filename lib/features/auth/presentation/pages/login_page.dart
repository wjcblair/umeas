import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/extensions/buildcontext/loc.dart';
import 'package:umeas/features/auth/domain/failures/login_failures.dart';
import 'package:umeas/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/utilities/dialogs/error_dialog.dart';
import '../../../../injection_container.dart';
import '../../domain/failures/generic_failures.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) async {
      if (state is AuthLoggedOutState) {
        if (state.failure is UserNotFoundAuthFailure) {
          await showErrorDialog(
            context,
            context.loc.login_error_cannot_find_user,
          );
        } else if (state.failure is WrongPasswordAuthFailure) {
          await showErrorDialog(
            context,
            context.loc.login_error_wrong_credentials,
          );
        } else if (state.failure is GenericAuthFailure) {
          await showErrorDialog(
            context,
            context.loc.login_error_auth_error,
          );
        }
      }
    }, builder: (context, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.login),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(context.loc.login_view_prompt),
                TextField(
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: context.loc.email_text_field_placeholder,
                  ),
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: context.loc.password_text_field_placeholder,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    print("Login button pressed");
                    context.read<AuthBloc>().add(
                          AuthLogInEvent(
                              email: _email.text, password: _password.text),
                        );
                  },
                  child: Text(context.loc.login),
                ),
                TextButton(
                  onPressed: () {
                    print("Forgot password button pressed");
                    context.read<AuthBloc>().add(
                          AuthForgotPasswordEvent(email: _email.text),
                        );
                  },
                  child: Text(
                    context.loc.login_view_forgot_password,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print("Register button pressed");
                    context.read<AuthBloc>().add(
                          AuthShouldRegisterEvent(),
                        );
                  },
                  child: Text(
                    context.loc.login_view_not_registered_yet,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
