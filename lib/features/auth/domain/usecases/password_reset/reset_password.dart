import 'package:dartz/dartz.dart';
import 'package:umeas/core/domain/usecases/usecase.dart';

import '../../../../../core/domain/failures/app_failure.dart';
import '../../repositories/i_auth_repository_contract.dart';
import 'email_param.dart';

class ResetPassword extends UseCase<void, EmailParam> {
  final IAuthRepositoryContract repository;

  ResetPassword({required this.repository});

  @override
  Future<Either<AppFailure, void>> call(EmailParam params) async {
    return await repository.sendPasswordReset(toEmail: params.email);
  }
}
