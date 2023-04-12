import 'package:flutter/material.dart';
import 'package:umeas/features/home/presentation/pages/home_page.dart';

import '../../features/splash/presentation/pages/splash_page.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
}

class RouteGenerator {
  static Route? getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(
            title: 'Splash Page',
            key: null,
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(
            title: 'Home View',
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
