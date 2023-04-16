import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/app_failure.dart';
import '../entities/auth_user.dart';

abstract class IAuthProviderContract {
  Future<Either<AppFailure, Unit>> initialize();
  Future<Either<AppFailure, AuthUser>> getCurrentUser();
  Future<Either<AppFailure, AuthUser>> logIn({
    required String email,
    required String password,
  });
  Future<Either<AppFailure, AuthUser>> registerUser({
    required String email,
    required String password,
  });
  Future<Either<AppFailure, Unit>> logOut();
  Future<Either<AppFailure, Unit>> sendEmailVerification();
  Future<Either<AppFailure, Unit>> sendPasswordReset({required String toEmail});
}
