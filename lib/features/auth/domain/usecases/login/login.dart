import 'package:dartz/dartz.dart';
import 'package:umeas/core/domain/usecases/usecase.dart';
import 'package:umeas/features/auth/domain/usecases/core/auth_user_params.dart';

import '../../../../../core/domain/failures/app_failure.dart';
import '../../entities/auth_user.dart';
import '../../repositories/i_auth_repository_contract.dart';

class Login implements UseCase<AuthUser, AuthUserParams> {
  final IAuthRepositoryContract repository;

  Login({required this.repository});

  @override
  Future<Either<AppFailure, AuthUser>> call(AuthUserParams params) async {
    return await repository.logIn(
        email: params.email, password: params.password);
  }
}
