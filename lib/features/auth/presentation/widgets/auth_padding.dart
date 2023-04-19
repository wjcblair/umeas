import 'package:flutter/material.dart';

class AuthPadding extends StatelessWidget {
  final Widget child;

  const AuthPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: child,
    );
  }
}
