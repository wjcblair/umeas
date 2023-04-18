import 'package:umeas/core/error/failures/app_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:umeas/core/layer_abstractions/domain/usecases/noparams.dart';
import 'package:umeas/core/layer_abstractions/domain/usecases/usecase.dart';

import '../../repositories/i_auth_repository_contract.dart';

class Initialize implements UseCase<void, NoParams> {
  final IAuthRepositoryContract repository;

  Initialize({required this.repository});

  @override
  Future<Either<AppFailure, void>> call(NoParams params) async {
    return await repository.initialize();
  }
}
