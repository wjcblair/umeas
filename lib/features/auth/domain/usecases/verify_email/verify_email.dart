import 'package:dartz/dartz.dart';
import 'package:umeas/core/domain/usecases/noparams.dart';

import '../../../../../core/domain/failures/app_failure.dart';
import '../../../../../core/domain/usecases/usecase.dart';
import '../../repositories/i_auth_repository_contract.dart';

class VerifyEmail extends UseCase<void, NoParams> {
  final IAuthRepositoryContract repository;

  VerifyEmail({required this.repository});

  @override
  Future<Either<AppFailure, void>> call(NoParams params) async {
    return await repository.sendEmailVerification();
  }
}
