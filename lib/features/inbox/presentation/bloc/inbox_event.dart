part of 'inbox_bloc.dart';

abstract class InboxEvent {
  const InboxEvent();
}

abstract class InboxLoadMessagesEvent extends InboxEvent {
  const InboxLoadMessagesEvent();
}

class InboxLoadMessagesWithGoogleApiEvent extends InboxLoadMessagesEvent {
  const InboxLoadMessagesWithGoogleApiEvent();
}

class InboxLoadMessagesWithMicrosoftApiEvent extends InboxLoadMessagesEvent {
  const InboxLoadMessagesWithMicrosoftApiEvent();
}

class InboxNoMessagesToLoadEvent extends InboxEvent {
  const InboxNoMessagesToLoadEvent();
}
