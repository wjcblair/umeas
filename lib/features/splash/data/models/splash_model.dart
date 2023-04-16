import 'package:flutter/material.dart';
import 'package:umeas/features/splash/domain/entities/splash.dart';

class SplashModel extends Splash {
  const SplashModel(
      {required super.delay, required super.image, required super.nextRoute});

  factory SplashModel.fromConstants(
      String imagePath, int delay, String nextRoute) {
    return SplashModel(
      image: AssetImage(imagePath),
      delay: delay,
      nextRoute: nextRoute,
    );
  }
}
