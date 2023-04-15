import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:umeas/features/splash/constants/splash_constants.dart';
import 'package:umeas/features/splash/data/models/splash_model.dart';
import 'package:umeas/features/splash/domain/entities/splash.dart';

void main() {
  late SplashModel tSplashModel;

  setUp(() {
    tSplashModel = const SplashModel(
        delay: SplashConstants.kDelay,
        image: AssetImage(SplashConstants.kLogo),
        nextRoute: SplashConstants.kNextRoute);
  });

  test(
    "should be a subclass of Splash entity",
    () async {
      // Arrange

      // Act

      // Assert
      expect(tSplashModel, isA<Splash>());
    },
  );
}
