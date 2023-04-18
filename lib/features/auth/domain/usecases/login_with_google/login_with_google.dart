import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures/app_failure.dart';
import '../../../../../core/layer_abstractions/domain/usecases/noparams.dart';
import '../../../../../core/layer_abstractions/domain/usecases/usecase.dart';
import '../../repositories/i_auth_repository_contract.dart';

class LoginWithGoogle extends UseCase<void, NoParams> {
  final IAuthRepositoryContract repository;

  LoginWithGoogle({required this.repository});

  @override
  Future<Either<AppFailure, void>> call(NoParams params) async {
    return await repository.logInWithGoogle();
  }
}
