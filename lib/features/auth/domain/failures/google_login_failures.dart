import 'package:umeas/core/error/failures/app_failure.dart';

class GoogleSignInCancelledFailure extends AppFailure {
  const GoogleSignInCancelledFailure(
      {message = 'Google Sign In Cancelled Failure'})
      : super(message: message);
}

class GoogleSignInServerFailure extends AppFailure {
  const GoogleSignInServerFailure({message = 'Google Sign In Server Failure'})
      : super(message: message);
}
