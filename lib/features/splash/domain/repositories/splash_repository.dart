import 'package:dartz/dartz.dart';
import 'package:umeas/features/splash/domain/entities/splash.dart';

import '../../../../core/error/failures/failure.dart';

abstract class ISplashRepository {
  Future<Either<Failure, Splash>> getSplash(String tImagePath);
}
