import 'package:dartz/dartz.dart';
import 'package:umeas/core/domain/usecases/usecase.dart';

import '../../../../core/domain/failures/app_failure.dart';
import '../../../../core/domain/usecases/noparams.dart';
import '../entities/splash.dart';
import '../repositories/i_splash_repository_contract.dart';

class GetSplash implements UseCase<Splash, NoParams> {
  final ISplashRepositoryContract repository;

  GetSplash({required this.repository});

  @override
  Future<Either<AppFailure, Splash>> call(NoParams params) async {
    return await repository.getSplash();
  }
}
