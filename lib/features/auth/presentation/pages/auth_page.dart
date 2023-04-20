import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:umeas/features/auth/presentation/pages/login_page.dart';
import 'package:umeas/features/auth/presentation/pages/register_page.dart';
import 'package:umeas/features/auth/presentation/pages/verify_email_page.dart';
import 'package:umeas/features/home/presentation/pages/home_page.dart';

import '../../../../core/presentation/widgets/helpers/loading/loading.dart';
import '../../../../injection_container.dart';
import '../bloc/auth/auth_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final authBloc = sl<AuthBloc>();
        authBloc.add(AuthInitializeEvent());
        return authBloc;
      },
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isLoading) {
            print("auth page recieved loading state");
            LoadingScreen().show(
              context: context,
              text: state.loadingText ?? 'Please wait a moment',
            );
          } else {
            LoadingScreen().hide();
          }
        },
        builder: (context, state) {
          if (state is AuthLoggedInState) {
            return const HomePage(
              title: 'Home Page',
            );
          } else if (state is AuthNeedsVerificationState) {
            print("auth page recieved verify email state");
            return const VerifyEmailPage();
          } else if (state is AuthLoggedOutState) {
            print("auth page recieved logged out state");
            return const LoginPage();
          } else if (state is AuthForgotPasswordState) {
            print("auth page recieved forgot password state");
            return const ForgotPasswordPage();
          } else if (state is AuthRegisteringState) {
            print("auth page recieved register state");
            return const RegisterPage();
          } else {
            print("Cant find state for auth page");
            return const Scaffold(
              body: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
