import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/extensions/buildcontext/loc.dart';
import 'package:umeas/features/auth/domain/failures/register_failures.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_form.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_text_button.dart';

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
      return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.register),
        ),
        body: AuthPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.loc.register_view_prompt),
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
                          return AuthTextButton(
                            text: context.loc.register,
                            event: AuthRegisterEvent(
                              _email.text,
                              _password.text,
                            ),
                            enabled: formValid,
                          );
                        },
                      ),
                      AuthTextButton(
                        text: context.loc.register_view_already_registered,
                        event: AuthLogOutEvent(),
                        enabled: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
