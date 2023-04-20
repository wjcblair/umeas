import '../../../../core/domain/failures/app_failure.dart';

class InvalidEmailAndPasswordCombinationFailure extends AppFailure {
  const InvalidEmailAndPasswordCombinationFailure(
      {message = 'Invalid Email and Password Combination Failure'})
      : super(message: message);
}

class UserNotFoundAuthFailure
    extends InvalidEmailAndPasswordCombinationFailure {}

class WrongPasswordAuthFailure
    extends InvalidEmailAndPasswordCombinationFailure {}
