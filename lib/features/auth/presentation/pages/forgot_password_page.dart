import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/extensions/buildcontext/loc.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_padding.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_text_button.dart';
import 'package:umeas/features/auth/presentation/widgets/textfields/email_text_field.dart';

import '../../../../core/presentation/widgets/dialogs/error_dialog.dart';
import '../../../../core/presentation/widgets/dialogs/reset_password_email_send_dialog.dart';
import '../bloc/auth/auth_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController _controller;
  late final ValueNotifier<bool> _emailValid;

  @override
  void initState() {
    _emailValid = ValueNotifier<bool>(false);
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
    // final authFormBloc = BlocProvider.of<AuthFormBloc>(context);
    // final email = authFormBloc.state.email;
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
          body: AuthPadding(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    context.loc.forgot_password_view_prompt,
                  ),
                  EmailTextField(
                    context: context,
                    controller: _controller,
                    isValid: _emailValid,
                  ),
                  ValueListenableBuilder(
                    valueListenable: _emailValid,
                    builder: (BuildContext context, emailValid, Widget? child) {
                      return AuthTextButton(
                        text: context.loc.forgot_password_view_send_me_link,
                        event: AuthForgotPasswordEvent(email: _controller.text),
                        enabled: emailValid,
                      );
                    },
                  ),
                  AuthTextButton(
                    text: context.loc.forgot_password_view_back_to_login,
                    event: AuthLogOutEvent(),
                    enabled: true,
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
