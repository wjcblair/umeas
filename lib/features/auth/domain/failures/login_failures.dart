import 'package:umeas/core/error/failures/app_failure.dart';

class UserNotFoundAuthFailure extends AppFailure {
  const UserNotFoundAuthFailure({message = 'User Not Found Auth Failure'})
      : super(message: message);
}

class WrongPasswordAuthFailure extends AppFailure {
  const WrongPasswordAuthFailure({message = 'Wrong Password Auth Failure'})
      : super(message: message);
}
