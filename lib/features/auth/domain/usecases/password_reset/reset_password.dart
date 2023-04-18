import 'package:dartz/dartz.dart';
import 'package:umeas/core/error/failures/app_failure.dart';
import 'package:umeas/core/layer_abstractions/domain/usecases/usecase.dart';
import 'package:umeas/features/auth/domain/usecases/password_reset/email_param.dart';

import '../../repositories/i_auth_repository_contract.dart';

class ResetPassword extends UseCase<void, EmailParam> {
  final IAuthRepositoryContract repository;

  ResetPassword({required this.repository});

  @override
  Future<Either<AppFailure, void>> call(EmailParam params) async {
    return await repository.sendPasswordReset(toEmail: params.email);
  }
}
