part of 'inbox_bloc.dart';

abstract class InboxEvent {
  const InboxEvent();
}

class InboxLoadMessagesEvent extends InboxEvent {
  const InboxLoadMessagesEvent();
}
