import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/core/extensions/buildcontext/loc.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_padding.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_page_layout.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_text_button.dart';
import 'package:umeas/features/auth/presentation/widgets/textfields/email_text_field.dart';

import '../../../../core/presentation/colors/color_manager.dart';
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
    _emailValid.dispose();
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
      return AuthPageLayout(
        child: Column(
          children: [
            Text(
              context.loc.forgot_password,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 45.0),
            Text(
              context.loc.login_view_prompt,
            ),
            EmailTextField(
              controller: _controller,
              isValid: _emailValid,
            ),
            ValueListenableBuilder(
              valueListenable: _emailValid,
              builder: (BuildContext context, emailValid, Widget? child) {
                return ButtonTheme(
                  minWidth: 88.0,
                  height: 40.0,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: ColorManager.umGreen,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    onPressed: emailValid
                        ? () => context.read<AuthBloc>().add(
                            AuthForgotPasswordEvent(email: _controller.text))
                        : null,
                    child: Text(context.loc.forgot_password_view_send_me_link),
                  ),
                );
              },
            ),
            ButtonTheme(
              minWidth: 88.0,
              height: 40.0,
              child: TextButton(
                onPressed: () =>
                    context.read<AuthBloc>().add(AuthLogOutEvent()),
                child: Text(context.loc.forgot_password_view_back_to_login,
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      );
    });
  }
}
