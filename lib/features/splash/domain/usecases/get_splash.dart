import 'package:dartz/dartz.dart';
import 'package:umeas/core/error/failures/failure.dart';

import '../entities/splash.dart';
import '../repositories/splash_repository.dart';

class GetSplash {
  final ISplashRepository repository;

  GetSplash(this.repository);

  Future<Either<Failure, Splash>> call({required String imagePath}) async {
    return await repository.getSplash(imagePath);
  }
}
