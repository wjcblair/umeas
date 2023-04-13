import 'package:dartz/dartz.dart';
import 'package:umeas/features/splash/domain/entities/splash.dart';

import '../../../../core/error/failures/i_failure.dart';

abstract class ISplashRepositoryContract {
  Future<Either<IFailure, Splash>> getSplash();
}
