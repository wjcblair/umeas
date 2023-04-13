import 'package:dartz/dartz.dart';
import 'package:umeas/core/error/failures/i_failure.dart';
import 'package:umeas/core/layer_abstractions/domain/usecases/usecase.dart';

import '../../../../core/layer_abstractions/domain/usecases/noparams.dart';
import '../entities/splash.dart';
import '../repositories/i_splash_repository_contract.dart';

class GetSplash implements UseCase<Splash, NoParams> {
  final ISplashRepositoryContract repository;

  GetSplash(this.repository);

  @override
  Future<Either<IFailure, Splash>> call(NoParams params) async {
    return await repository.getSplash();
  }
}
