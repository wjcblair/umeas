import 'package:umeas/core/error/failures/app_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:umeas/core/layer_abstractions/domain/usecases/usecase.dart';
import 'package:umeas/features/auth/domain/repositories/auth_provider.dart';
import 'package:umeas/features/auth/domain/usecases/core/auth_user_params.dart';

import '../../entities/auth_user.dart';

class Login implements UseCase<AuthUser, AuthUserParams> {
  final IAuthProviderContract repository;

  Login({required this.repository});

  @override
  Future<Either<AppFailure, AuthUser>> call(AuthUserParams params) async {
    return await repository.logIn(
        email: params.email, password: params.password);
  }
}
