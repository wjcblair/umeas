import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class AuthTextButton extends StatelessWidget {
  final String text;
  final AuthEvent event;

  const AuthTextButton({
    Key? key,
    required this.text,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.read<AuthBloc>().add(event),
      child: Text(text),
    );
  }
}
