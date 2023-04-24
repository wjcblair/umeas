import 'package:dartz/dartz.dart';
import 'package:umeas/features/splash/domain/entities/splash.dart';

import '../../../../core/domain/failures/app_failure.dart';

abstract class ISplashRepositoryContract {
  Future<Either<AppFailure, Splash>> getSplash();
}
