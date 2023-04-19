import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/extensions/buildcontext/loc.dart';
import 'package:umeas/features/auth/domain/failures/register_failures.dart';
import 'package:umeas/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/utilities/dialogs/error_dialog.dart';
import '../../domain/failures/generic_failures.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      if (state is AuthRegisteringState) {
        if (state.failure is WeakPasswordAuthFailure) {
          await showErrorDialog(
            context,
            context.loc.register_error_weak_password,
          );
        } else if (state.failure is EmailAlreadyInUseAuthFailure) {
          await showErrorDialog(
            context,
            context.loc.register_error_email_already_in_use,
          );
        } else if (state.failure is GenericAuthFailure) {
          await showErrorDialog(
            context,
            context.loc.register_error_generic,
          );
        } else if (state.failure is InvalidEmailAuthFailure) {
          await showErrorDialog(
            context,
            context.loc.register_error_invalid_email,
          );
        }
      }
    }, builder: (context, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.register),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.loc.register_view_prompt),
                TextField(
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  autofocus: true,
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
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () async {
                          context.read<AuthBloc>().add(
                                AuthRegisterEvent(
                                  email: _email.text,
                                  password: _password.text,
                                ),
                              );
                        },
                        child: Text(
                          context.loc.register,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                AuthLogOutEvent(),
                              );
                        },
                        child: Text(
                          context.loc.register_view_already_registered,
                        ),
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
