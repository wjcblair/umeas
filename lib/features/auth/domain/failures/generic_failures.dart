import 'package:umeas/core/error/failures/app_failure.dart';

class InitializeAuthFailure extends AppFailure {
  const InitializeAuthFailure({message = 'Initialize Auth Failure'})
      : super(message: message);
}

class GenericAuthFailure extends AppFailure {
  const GenericAuthFailure({message = 'Generic Auth Failure'})
      : super(message: message);
}

class UserNotLoggedInAuthFailure extends AppFailure {
  const UserNotLoggedInAuthFailure(
      {message = 'User Not Logged In Auth Failure'})
      : super(message: message);
}
