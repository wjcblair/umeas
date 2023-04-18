import 'package:dartz/dartz.dart';

import '../../../../core/error/failures/app_failure.dart';
import '../entities/auth_user.dart';

abstract class IAuthRepositoryContract {
  Future<Either<AppFailure, void>> initialize();
  Future<Either<AppFailure, AuthUser>> getCurrentUser();
  Future<Either<AppFailure, AuthUser>> logIn({
    required String email,
    required String password,
  });
  Future<Either<AppFailure, AuthUser>> registerUser({
    required String email,
    required String password,
  });
  Future<Either<AppFailure, void>> logOut();
  Future<Either<AppFailure, void>> sendEmailVerification();
  Future<Either<AppFailure, void>> sendPasswordReset({required String toEmail});
  Future<Either<AppFailure, void>> logInWithGoogle();
}
