import 'package:bloc/bloc.dart';
import 'package:umeas/features/inbox/domain/usecases/fetch_messages.dart';

import '../../../auth/domain/entities/email_provider.dart';
import '../../domain/entities/message.dart';

part 'inbox_event.dart';
part 'inbox_state.dart';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final FetchMessages fetchMessages;

  InboxBloc({required this.fetchMessages}) : super(const InboxInitialState()) {
    on<InboxLoadMessagesEvent>((event, emit) async {
      final EmailProvider provider;
      if (event == const InboxLoadMessagesWithGoogleApiEvent()) {
        provider = EmailProvider.google;
      } else {
        provider = EmailProvider.microsoft;
      }
      final messages =
          await fetchMessages(FetchMessagesParams(emailProvider: provider));
      return messages.fold(
        (failure) {
          emit(const InboxErrorState());
        },
        (messages) {
          emit(InboxLoadedState(messages: messages));
        },
      );
    });
    on<InboxNoMessagesToLoadEvent>((event, emit) {
      emit(const InboxNoMessagesState());
    });
  }
}
