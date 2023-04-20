abstract class InvalidEmailAndPasswordCombinationException
    implements Exception {}

class UserNotFoundAuthException
    extends InvalidEmailAndPasswordCombinationException {}

class WrongPasswordAuthException
    extends InvalidEmailAndPasswordCombinationException {}
