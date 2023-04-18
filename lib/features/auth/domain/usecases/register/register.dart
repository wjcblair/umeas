import 'package:dartz/dartz.dart';
import 'package:umeas/core/layer_abstractions/domain/usecases/usecase.dart';
import 'package:umeas/features/auth/domain/usecases/core/auth_user_params.dart';

import '../../../../../core/error/failures/app_failure.dart';
import '../../entities/auth_user.dart';
import '../../repositories/i_auth_repository_contract.dart';

class Register extends UseCase<AuthUser, AuthUserParams> {
  final IAuthRepositoryContract repository;

  Register({required this.repository});
  @override
  Future<Either<AppFailure, AuthUser>> call(AuthUserParams params) async {
    return await repository.registerUser(
        email: params.email, password: params.password);
  }
}
