import 'package:bloc/bloc.dart';
import 'package:umeas/features/inbox/domain/usecases/fetch_messages.dart';

import '../../../../core/domain/usecases/noparams.dart';
import '../../domain/entities/message.dart';

part 'inbox_event.dart';
part 'inbox_state.dart';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final FetchMessages fetchMessages;

  InboxBloc({required this.fetchMessages}) : super(const InboxInitialState()) {
    on<InboxLoadMessagesEvent>((event, emit) async {
      // print('login with google event');
      final messages = await fetchMessages(NoParams());
      return messages.fold(
        (failure) {
          print('failure');
          emit(const InboxErrorState());
        },
        (messages) {
          emit(InboxLoadedState(messages: messages));
        },
      );
    });
  }
}
