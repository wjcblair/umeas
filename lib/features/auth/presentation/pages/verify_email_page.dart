import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/extensions/buildcontext/loc.dart';

import '../bloc/auth_bloc.dart';

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                context.loc.verify_email_view_prompt,
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      AuthSendEmailVerificationEvent(),
                    );
              },
              child: Text(
                context.loc.verify_email_send_email_verification,
              ),
            ),
            TextButton(
              onPressed: () async {
                context.read<AuthBloc>().add(
                      AuthLogOutEvent(),
                    );
              },
              child: Text(
                context.loc.restart,
              ),
            )
          ],
        ),
      ),
    );
  }
}
