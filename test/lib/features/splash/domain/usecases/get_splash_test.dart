import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:umeas/features/splash/domain/entities/splash.dart';
import 'package:umeas/features/splash/domain/repositories/splash_repository.dart';
import 'package:umeas/features/splash/domain/usecases/get_splash.dart';

class MockSplashRepository extends Mock implements ISplashRepository {}

void main() {
  late GetSplash usecase;
  late MockSplashRepository mockSplashRepository;

  setUp(() {
    mockSplashRepository = MockSplashRepository();
    usecase = GetSplash(mockSplashRepository);
  });

  const tImagePath = "assets/images/splash.png";
  const tSplash = Splash(imagePath: tImagePath);

  test(
    "Should get the splash data from the repository",
    () async {
      // Arrange
      when(() => mockSplashRepository.getSplash(any()))
          .thenAnswer((_) async => const Right(tSplash));

      // Act
      final result = await usecase.execute(imagePath: tImagePath);

      // Assert
      expect(result, const Right(tSplash));
      verify(() => mockSplashRepository.getSplash(tImagePath)).called(1);
      verifyNoMoreInteractions(mockSplashRepository);
    },
  );
}
