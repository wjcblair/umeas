import 'package:dartz/dartz.dart';
import 'package:umeas/core/layer_abstractions/domain/usecases/noparams.dart';
import 'package:umeas/features/auth/domain/repositories/auth_provider.dart';

import '../../../../../core/error/failures/app_failure.dart';
import '../../../../../core/layer_abstractions/domain/usecases/usecase.dart';

class VerifyEmail extends UseCase<Unit, NoParams> {
  final IAuthProviderContract repository;

  VerifyEmail({required this.repository});

  @override
  Future<Either<AppFailure, Unit>> call(NoParams params) async {
    return await repository.sendEmailVerification();
  }
}
