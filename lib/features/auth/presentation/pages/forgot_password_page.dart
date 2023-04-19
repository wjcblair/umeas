import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/extensions/buildcontext/loc.dart';

import '../../../../core/utilities/dialogs/error_dialog.dart';
import '../../../../core/utilities/dialogs/reset_password_email_send_dialog.dart';
import '../../../../injection_container.dart';
import '../bloc/auth_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) async {
      if (state is AuthForgotPasswordState) {
        if (state.hasSentEmail) {
          _controller.clear();
          await showResetPasswordSentDialog(context);
        }
        if (state.failure != null) {
          // ignore: use_build_context_synchronously
          await showErrorDialog(
            context,
            // ignore: use_build_context_synchronously
            context.loc.forgot_password_view_generic_error,
          );
        }
      }
    }, builder: (context, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.forgot_password),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  context.loc.forgot_password_view_prompt,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  autofocus: true,
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: context.loc.email_text_field_placeholder,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final email = _controller.text;
                    context
                        .read<AuthBloc>()
                        .add(AuthForgotPasswordEvent(email: email));
                  },
                  child: Text(
                    context.loc.forgot_password_view_send_me_link,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          AuthLogOutEvent(),
                        );
                  },
                  child: Text(
                    context.loc.forgot_password_view_back_to_login,
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
