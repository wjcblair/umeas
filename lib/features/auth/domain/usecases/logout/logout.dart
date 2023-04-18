import 'package:umeas/core/error/failures/app_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:umeas/core/layer_abstractions/domain/usecases/noparams.dart';
import 'package:umeas/core/layer_abstractions/domain/usecases/usecase.dart';
import 'package:umeas/features/auth/domain/usecases/core/auth_user_params.dart';

import '../../repositories/i_auth_repository_contract.dart';

class Logout implements UseCase<void, NoParams> {
  final IAuthRepositoryContract repository;

  Logout({required this.repository});

  @override
  Future<Either<AppFailure, void>> call(NoParams params) async {
    return await repository.logOut();
  }
}
