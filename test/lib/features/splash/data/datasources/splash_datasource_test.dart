import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:umeas/features/splash/constants/splash_constants.dart';
import 'package:umeas/features/splash/data/datasources/local/i_splash_local_datasource_contract.dart';
import 'package:umeas/features/splash/data/models/splash_model.dart';

class MockSplashLocalDataSource extends Mock
    implements ISplashLocalDataSourceContract {}

void main() {
  late MockSplashLocalDataSource mockLocalDataSource;
  late SplashModel tSplashModel;

  setUp(() {
    mockLocalDataSource = MockSplashLocalDataSource();
    tSplashModel = const SplashModel(
      image: AssetImage(SplashConstants.kLogo),
      delay: SplashConstants.kDelay,
      nextRoute: SplashConstants.kNextRoute,
    );
  });

  test(
      'should return SplashModel from local data source when call to getModel is successful',
      () async {
    // Arrange
    when(() => mockLocalDataSource.getModel())
        .thenAnswer((_) async => tSplashModel);

    // Act
    final result = await mockLocalDataSource.getModel();

    // Assert
    verify(() => mockLocalDataSource.getModel());
    expect(result, tSplashModel);
  });

  test(
      'should cache SplashModel in local data source when call to cacheModel is successful',
      () async {
    // Arrange
    when(() => mockLocalDataSource.cacheModel(tSplashModel))
        .thenAnswer((_) async => Future.value());

    // Act
    await mockLocalDataSource.cacheModel(tSplashModel);

    // Assert
    verify(() => mockLocalDataSource.cacheModel(tSplashModel));
  });
}
