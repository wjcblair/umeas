import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_bloc.dart';

class AuthTextButton extends StatelessWidget {
  final String text;
  final AuthEvent event;
  final bool enabled;

  const AuthTextButton({
    Key? key,
    required this.text,
    required this.event,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? () => context.read<AuthBloc>().add(event) : null,
      child: Text(text),
    );
  }
}
