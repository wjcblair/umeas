import 'package:dartz/dartz.dart';
import 'package:umeas/core/layer_abstractions/domain/usecases/noparams.dart';
import 'package:umeas/core/layer_abstractions/domain/usecases/usecase.dart';
import 'package:umeas/features/auth/domain/entities/auth_user.dart';

import '../../../../../core/error/failures/app_failure.dart';
import '../../repositories/i_auth_repository_contract.dart';

class GetCurrentUser implements UseCase<AuthUser, NoParams> {
  final IAuthRepositoryContract repository;

  GetCurrentUser({required this.repository});

  @override
  Future<Either<AppFailure, AuthUser>> call(NoParams params) async {
    return await repository.getCurrentUser();
  }
}
