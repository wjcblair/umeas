import 'package:flutter/material.dart';
import 'package:umeas/extensions/buildcontext/loc.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_padding.dart';
import 'package:umeas/features/auth/presentation/widgets/auth_text_button.dart';

import '../bloc/auth/auth_bloc.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.verify_email),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthPadding(
              child: Text(
                context.loc.verify_email_view_prompt,
              ),
            ),
            AuthTextButton(
              text: context.loc.verify_email_send_email_verification,
              event: AuthSendEmailVerificationEvent(),
              enabled: true,
            ),
            AuthTextButton(
              text: context.loc.restart,
              event: AuthLogOutEvent(),
              enabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
