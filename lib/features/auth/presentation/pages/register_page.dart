import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/core/extensions/buildcontext/loc.dart';
import 'package:umeas/features/auth/domain/failures/register_failures.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_form.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_page_layout.dart';

import '../../../../core/presentation/colors/app_colors.dart';
import '../../../../core/presentation/widgets/dialogs/error_dialog.dart';
import '../../../../core/presentation/widgets/helpers/two_value_listenable_builder.dart';
import '../../domain/failures/generic_failures.dart';
import '../bloc/auth/auth_bloc.dart';
import '../widgets/auth_padding.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) async {
      print("State in listener: $state");
      if (state is AuthRegisteringState) {
        print("Registering");
        if (state.failure is WeakPasswordAuthFailure) {
          print("Weak password dialog");
          await showErrorDialog(
            context,
            context.loc.register_error_weak_password,
          );
        } else if (state.failure is EmailAlreadyInUseAuthFailure) {
          print("Email already in use dialog");
          await showErrorDialog(
            context,
            context.loc.register_error_email_already_in_use,
          );
        } else if (state.failure is GenericAuthFailure) {
          print("Generic error dialog");
          await showErrorDialog(
            context,
            context.loc.register_error_generic,
          );
        } else if (state.failure is InvalidEmailAuthFailure) {
          print("Invalid email dialog");
          await showErrorDialog(
            context,
            context.loc.register_error_invalid_email,
          );
        }
      }
    }, builder: (context, state) {
      print("State in builder: $state");
      return AuthPageLayout(
        child: Column(
          children: [
            Text(
              context.loc.register,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 45.0),
            Text(
              context.loc.register_view_prompt,
            ),
            AuthForm(
              emailController: _email,
              passwordController: _password,
              emailValid: _isEmailValid,
              passwordValid: _isPasswordValid,
            ),
            Center(
              child: Column(
                children: [
                  TwoValueListenableBuilder<bool, bool>(
                    first: _isEmailValid,
                    second: _isPasswordValid,
                    child: Container(),
                    builder: (context, emailValid, passwordValid, child) {
                      final formValid = emailValid && passwordValid;
                      return ButtonTheme(
                        minWidth: 88.0,
                        height: 40.0,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            //foregroundColor: Colors.white,
                            //backgroundColor: ColorManager.umGreen,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                          onPressed: formValid
                              ? () => context.read<AuthBloc>().add(
                                    AuthRegisterEvent(
                                      _email.text,
                                      _password.text,
                                    ),
                                  )
                              : null,
                          child: Text(context.loc.register),
                        ),
                      );
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 10.0),
                    child: Text(context.loc.register_view_already_registered,
                        style: const TextStyle(fontSize: 14.0),
                        textAlign: TextAlign.center),
                  ),
                  ButtonTheme(
                    minWidth: 88.0,
                    height: 40.0,
                    child: TextButton(
                      onPressed: () =>
                          context.read<AuthBloc>().add(AuthLogOutEvent()),
                      child: Text(context.loc.register_view_login_here,
                          style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
