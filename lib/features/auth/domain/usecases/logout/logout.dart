import 'package:dartz/dartz.dart';
import 'package:umeas/core/domain/usecases/noparams.dart';
import 'package:umeas/core/domain/usecases/usecase.dart';

import '../../../../../core/domain/failures/app_failure.dart';
import '../../repositories/i_auth_repository_contract.dart';

class Logout implements UseCase<void, NoParams> {
  final IAuthRepositoryContract repository;

  Logout({required this.repository});

  @override
  Future<Either<AppFailure, void>> call(NoParams params) async {
    return await repository.logOut();
  }
}
