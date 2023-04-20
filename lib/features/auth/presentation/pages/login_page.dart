import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/core/presentation/widgets/helpers/two_value_listenable_builder.dart';
import 'package:umeas/extensions/buildcontext/loc.dart';
import 'package:umeas/features/auth/domain/failures/login_failures.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_form.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_padding.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_text_button.dart';

import '../../../../core/presentation/widgets/dialogs/error_dialog.dart';
import '../../domain/failures/generic_failures.dart';
import '../bloc/auth/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final ValueNotifier<bool> _isEmailValid;
  late final ValueNotifier<bool> _isPasswordValid;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _isEmailValid = ValueNotifier<bool>(false);
    _isPasswordValid = ValueNotifier<bool>(false);
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _isEmailValid.dispose();
    _isPasswordValid.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthLoggedOutState) {
          if (state.failure is UserNotFoundAuthFailure) {
            print("User not found dialog");
            await showErrorDialog(
              context,
              context.loc.login_error_cannot_find_user,
            );
          } else if (state.failure is WrongPasswordAuthFailure) {
            print("Wrong password dialog");
            await showErrorDialog(
              context,
              context.loc.login_error_wrong_credentials,
            );
          } else if (state.failure is GenericAuthFailure) {
            print("Generic auth failure dialog");
            await showErrorDialog(
              context,
              context.loc.login_error_auth_error,
            );
          }
        }
      },
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.loc.login),
          ),
          body: AuthPadding(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(context.loc.login_view_prompt),
                  AuthForm(
                    emailController: _email,
                    passwordController: _password,
                    emailValid: _isEmailValid,
                    passwordValid: _isPasswordValid,
                  ),
                  TwoValueListenableBuilder<bool, bool>(
                    first: _isEmailValid,
                    second: _isPasswordValid,
                    child: Container(),
                    builder: (context, emailValid, passwordValid, child) {
                      final formValid = emailValid && passwordValid;
                      return AuthTextButton(
                        text: context.loc.login,
                        event: AuthLogInEvent(
                          _email.text,
                          _password.text,
                        ),
                        enabled: formValid,
                      );
                    },
                  ),
                  AuthTextButton(
                    text: context.loc.login_view_forgot_password,
                    event: AuthForgotPasswordEvent(),
                    enabled: true,
                  ),
                  AuthTextButton(
                    text: context.loc.login_view_not_registered_yet,
                    event: AuthShouldRegisterEvent(),
                    enabled: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
