import '../../../../core/domain/failures/app_failure.dart';

class InvalidEmailAndPasswordCombinationFailure extends AppFailure {}

class UserNotFoundAuthFailure
    extends InvalidEmailAndPasswordCombinationFailure {}

class WrongPasswordAuthFailure
    extends InvalidEmailAndPasswordCombinationFailure {}
