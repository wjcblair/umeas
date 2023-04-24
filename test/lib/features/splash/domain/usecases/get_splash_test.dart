import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:umeas/core/domain/usecases/noparams.dart';
import 'package:umeas/features/splash/constants/splash_constants.dart';
import 'package:umeas/features/splash/domain/entities/splash.dart';
import 'package:umeas/features/splash/domain/repositories/i_splash_repository_contract.dart';
import 'package:umeas/features/splash/domain/usecases/get_splash.dart';

class MockSplashRepository extends Mock implements ISplashRepositoryContract {}

void main() {
  late GetSplash usecase;
  late MockSplashRepository mockSplashRepository;
  late String tImagePath;
  late Splash tSplash;
  late int tDelay;

  setUp(() {
    mockSplashRepository = MockSplashRepository();
    usecase = GetSplash(repository: mockSplashRepository);
    tImagePath = SplashConstants.kLogo;
    tDelay = SplashConstants.kDelay;
    tSplash = Splash(
        delay: tDelay,
        image: AssetImage(tImagePath),
        nextRoute: SplashConstants.kNextRoute);
  });

  test(
    'should get the splash data when the call to the repository is successful',
    () async {
      // Arrange
      when(() => mockSplashRepository.getSplash())
          .thenAnswer((_) async => Right(tSplash));

      // Act
      final result = await usecase(NoParams());

      // Assert
      expect(result, Right(tSplash));
      verify(() => mockSplashRepository.getSplash()).called(1);
      verifyNoMoreInteractions(mockSplashRepository);
    },
  );
}
