import 'package:umeas/features/auth/data/datasources/exceptions/generic_exceptions.dart';
import 'package:umeas/features/auth/data/datasources/remote/i_auth_remote_datasource.dart';
import 'package:umeas/features/auth/domain/entities/auth_user.dart';

import 'package:dartz/dartz.dart';
import 'package:umeas/features/auth/domain/failures/generic_failures.dart';
import 'package:umeas/features/auth/domain/failures/google_login_failures.dart';
import 'package:umeas/features/auth/domain/failures/login_failures.dart';
import 'package:umeas/features/auth/domain/failures/register_failures.dart';

import '../../../../core/domain/failures/app_failure.dart';
import '../../domain/repositories/i_auth_repository_contract.dart';
import '../datasources/exceptions/google_login_exceptions.dart';
import '../datasources/exceptions/login_exceptions.dart';
import '../datasources/exceptions/register_exceptions.dart';

class AuthRepository implements IAuthRepositoryContract {
  final IAuthRemoteDatasourceContract remoteDatasource;

  AuthRepository({required this.remoteDatasource});

  @override
  Future<Either<AppFailure, AuthUser>> getCurrentUser() async {
    try {
      return Right(remoteDatasource.getCurrentUser());
    } on UserNotLoggedInAuthException {
      return Left(UserNotFoundAuthFailure());
    }
  }

  @override
  Future<Either<AppFailure, void>> initialize() async {
    try {
      return Right(remoteDatasource.initialize());
    } catch (e) {
      return const Left(InitializeAuthFailure());
    }
  }

  @override
  Future<Either<AppFailure, AuthUser>> logIn(
      {required String email, required String password}) async {
    try {
      return Right(
          await remoteDatasource.logIn(email: email, password: password));
    } on InvalidEmailAndPasswordCombinationException {
      return const Left(InvalidEmailAndPasswordCombinationFailure());
    } catch (_) {
      return const Left(GenericAuthFailure());
    }
  }

  @override
  Future<Either<AppFailure, void>> logOut() async {
    try {
      return Right(remoteDatasource.logOut());
    } on UserNotLoggedInAuthException {
      // print("User not logged in");
      return const Left(UserNotLoggedInAuthFailure());
    } catch (_) {
      return const Left(GenericAuthFailure());
    }
  }

  @override
  Future<Either<AppFailure, void>> logInWithGoogle() async {
    try {
      return Right(remoteDatasource.logInWithGoogle());
    } on GoogleSignInCancelledException {
      return const Left(GoogleSignInCancelledFailure());
    } on GoogleSignInServerErrorException {
      return const Left(GoogleSignInServerFailure());
    } catch (_) {
      return const Left(GenericAuthFailure());
    }
  }

  @override
  Future<Either<AppFailure, AuthUser>> registerUser(
      {required String email, required String password}) async {
    try {
      return Right(await remoteDatasource.registerUser(
          email: email, password: password));
    } on UserNotLoggedInAuthException {
      return const Left(UserNotLoggedInAuthFailure());
    } on WeakPasswordAuthException {
      return const Left(WeakPasswordAuthFailure());
    } on EmailAlreadyInUseAuthException {
      // print("Email already in use exception");
      return const Left(EmailAlreadyInUseAuthFailure());
    } on InvalidEmailAuthException {
      return const Left(InvalidEmailAuthFailure());
    } catch (_) {
      return const Left(GenericAuthFailure());
    }
  }

  @override
  Future<Either<AppFailure, void>> sendEmailVerification() async {
    try {
      return Right(remoteDatasource.sendEmailVerification());
    } on UserNotLoggedInAuthException {
      return const Left(UserNotLoggedInAuthFailure());
    }
  }

  @override
  Future<Either<AppFailure, void>> sendPasswordReset(
      {required String toEmail}) async {
    try {
      return Right(remoteDatasource.sendPasswordReset(toEmail: toEmail));
    } on InvalidEmailAuthException {
      return const Left(InvalidEmailAuthFailure());
    } on UserNotFoundAuthException {
      return Left(UserNotFoundAuthFailure());
    } catch (_) {
      return const Left(GenericAuthFailure());
    }
  }
}
