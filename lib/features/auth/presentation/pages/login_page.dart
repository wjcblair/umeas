import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/core/presentation/styles/app_text_styles.dart';
import 'package:umeas/core/presentation/widgets/helpers/two_value_listenable_builder.dart';
import 'package:umeas/core/extensions/buildcontext/loc.dart';
import 'package:umeas/features/auth/domain/failures/login_failures.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_form.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_page_layout.dart';

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
            //print("User not found dialog");
            await showErrorDialog(
              context,
              context.loc.login_error_cannot_find_user,
            );
          } else if (state.failure is WrongPasswordAuthFailure) {
            //print("Wrong password dialog");
            await showErrorDialog(
              context,
              context.loc.login_error_wrong_credentials,
            );
          } else if (state.failure is GenericAuthFailure) {
            //print("Generic auth failure dialog");
            await showErrorDialog(
              context,
              context.loc.login_error_auth_error,
            );
          }
        }
      },
      builder: (context, child) {
        return AuthPageLayout(
          child: Column(
            children: [
              Text(
                context.loc.login,
                style: AppTextStyles.headline5,
              ),
              const SizedBox(height: 45.0),
              // Text(
              //   context.loc.login_view_prompt,
              // ),
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
                  return ButtonTheme(
                    minWidth: 88.0,
                    height: 40.0,
                    child: ElevatedButton(
                      onPressed: formValid
                          ? () => context.read<AuthBloc>().add(
                                AuthLogInEvent(
                                  _email.text,
                                  _password.text,
                                ),
                              )
                          : null,
                      child: Text(context.loc.login),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonTheme(
                    minWidth: 88.0,
                    height: 40.0,
                    child: TextButton(
                      onPressed: () => context
                          .read<AuthBloc>()
                          .add(AuthForgotPasswordEvent()),
                      child: Text(
                        context.loc.login_view_forgot_password,
                        style: const TextStyle(
                            fontSize: 14.0,
                            decoration: TextDecoration.underline),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 44.0),
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 10.0),
                child: Text(context.loc.login_view_dont_have_an_account,
                    style: const TextStyle(fontSize: 14.0),
                    textAlign: TextAlign.center),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720, minWidth: 200),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 24),
                  child: ButtonTheme(
                    minWidth: 88.0,
                    height: 40.0,
                    child: TextButton(
                      onPressed: () => context
                          .read<AuthBloc>()
                          .add(AuthShouldRegisterEvent()),
                      child: Text(context.loc.login_view_sign_up,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            letterSpacing: 1,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720, minWidth: 200),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 24),
                  child: ButtonTheme(
                    minWidth: 88.0,
                    height: 40.0,
                    child: TextButton(
                      onPressed: () => context
                          .read<AuthBloc>()
                          .add(AuthLogInWithGoogleEvent()),
                      child: Text(context.loc.google_sign_in,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            letterSpacing: 1,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
