part of 'inbox_bloc.dart';

abstract class InboxState {
  const InboxState();
}

class InboxInitialState extends InboxState {
  const InboxInitialState();
}

class InboxLoadingState extends InboxState {
  const InboxLoadingState();
}

class InboxLoadedState extends InboxState {
  final List<Message> messages;
  const InboxLoadedState({required this.messages});
}

class InboxNoMessagesState extends InboxState {
  const InboxNoMessagesState();
}

class InboxErrorState extends InboxState {
  const InboxErrorState();
}
