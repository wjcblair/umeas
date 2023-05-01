abstract class InboxException implements Exception {}

class MailingException implements InboxException {}

class NoInternetConnectionException implements InboxException {}

class GenericInboxException implements InboxException {
  final String message;

  GenericInboxException(this.message);
}
