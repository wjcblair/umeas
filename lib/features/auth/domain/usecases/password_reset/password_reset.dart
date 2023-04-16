import 'package:dartz/dartz.dart';
import 'package:umeas/core/error/failures/app_failure.dart';
import 'package:umeas/core/layer_abstractions/domain/usecases/usecase.dart';
import 'package:umeas/features/auth/domain/usecases/password_reset/email_param.dart';

import '../../repositories/auth_provider.dart';

class PasswordReset extends UseCase<Unit, EmailParam> {
  final IAuthProviderContract repository;

  PasswordReset({required this.repository});

  @override
  Future<Either<AppFailure, Unit>> call(EmailParam params) async {
    return await repository.sendPasswordReset(toEmail: params.email);
  }
}
