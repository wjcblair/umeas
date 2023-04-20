import 'package:flutter/material.dart';
import 'package:umeas/features/auth/presentation/pages/auth_page.dart';
import 'package:umeas/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:umeas/features/auth/presentation/pages/login_page.dart';
import 'package:umeas/features/auth/presentation/pages/register_page.dart';
import 'package:umeas/features/auth/presentation/pages/verify_email_page.dart';
import 'package:umeas/features/home/presentation/pages/home_page.dart';

import '../../../features/splash/presentation/pages/splash_page.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String auth = '/auth';
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String verifyEmail = '/auth/verifyEmail';
  static const String forgotPassword = '/auth/forgotPassword';
}

class RouteGenerator {
  static Route? getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(
            title: 'Home Page',
            key: null,
          ),
        );
      case Routes.auth:
        return MaterialPageRoute(
          builder: (_) => const AuthPage(
            key: null,
          ),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(
            key: null,
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(
            key: null,
          ),
        );
      case Routes.verifyEmail:
        return MaterialPageRoute(
          builder: (_) => const VerifyEmailPage(
            key: null,
          ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordPage(
            key: null,
          ),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(
          child: Text('No Route Found'),
        ),
      ),
    );
  }
}
