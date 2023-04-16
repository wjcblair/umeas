import 'package:dartz/dartz.dart';
import 'package:umeas/features/splash/domain/entities/splash.dart';

import '../../../../core/error/failures/app_failure.dart';

abstract class ISplashRepositoryContract {
  Future<Either<AppFailure, Splash>> getSplash();
}
