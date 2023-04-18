import 'package:umeas/core/error/failures/app_failure.dart';

class WeakPasswordAuthFailure extends AppFailure {
  const WeakPasswordAuthFailure({message = 'Weak Password Auth Failure'})
      : super(message: message);
}

class EmailAlreadyInUseAuthFailure extends AppFailure {
  const EmailAlreadyInUseAuthFailure(
      {message = 'Email Already In Use Auth Failure'})
      : super(message: message);
}

class InvalidEmailAuthFailure extends AppFailure {
  const InvalidEmailAuthFailure({message = 'Invalid Email Auth Failure'})
      : super(message: message);
}
