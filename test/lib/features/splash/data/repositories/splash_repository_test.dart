import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:umeas/core/data/exceptions/cache_exception.dart';
import 'package:umeas/core/domain/failures/cache_failure.dart';
import 'package:umeas/features/splash/constants/splash_constants.dart';
import 'package:umeas/features/splash/data/models/splash_model.dart';
import 'package:umeas/features/splash/data/repositories/splash_repository.dart';

import '../datasources/splash_datasource_test.dart';

void main() {
  late MockSplashLocalDataSource mockLocalDataSource;
  late SplashRepository mockRepository;

  setUpAll(() {
    registerFallbackValue(const SplashModel(
        delay: SplashConstants.kDelay,
        image: AssetImage(SplashConstants.kLogo),
        nextRoute: SplashConstants.kNextRoute));
  });

  setUp(() {
    mockLocalDataSource = MockSplashLocalDataSource();
    mockRepository = SplashRepository(localDataSource: mockLocalDataSource);
    when(() => mockLocalDataSource.cacheModel(any()))
        // ignore: avoid_returning_null_for_void
        .thenAnswer((_) async => null);
  });

  group('getSplash', () {
    const SplashModel tSplashModel = SplashModel(
        delay: SplashConstants.kDelay,
        image: AssetImage(SplashConstants.kLogo),
        nextRoute: SplashConstants.kNextRoute);
    const tSplash = tSplashModel;

    test(
      'should return local splash data when call to local datasource is successful)',
      () async {
        // Arrange
        when(() => mockLocalDataSource.getModel())
            .thenAnswer((_) async => tSplashModel);

        // Act
        final result = await mockRepository.getSplash();

        // Assert
        verify(() => mockLocalDataSource.getModel());
        expect(result, equals(const Right(tSplash)));
      },
    );

    test(
      'should cache splash model to local database when the call to local datasource is successful',
      () async {
        // Arrange
        when(() => mockLocalDataSource.getModel())
            .thenAnswer((_) async => tSplashModel);

        // Act
        await mockRepository.getSplash();

        // Assert
        verify(() => mockLocalDataSource.getModel());
        verify(() => mockLocalDataSource.cacheModel(tSplashModel));
      },
    );

    test(
      'should return cache failure when the call to local datasource is unsuccessful',
      () async {
        // Arrange
        when(() => mockLocalDataSource.getModel())
            .thenThrow(const CacheException(message: "test"));

        // Act
        final result = await mockRepository.getSplash();

        // Assert
        verify(() => mockLocalDataSource.getModel());
        expect(
            result,
            const Left(
                CacheFailure(message: "CacheException Exception: test")));
      },
    );
  });
}
