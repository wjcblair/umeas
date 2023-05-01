import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/features/inbox/presentation/bloc/inbox_bloc.dart';

import '../../../../injection_container.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InboxBloc>(
      create: (context) {
        final inboxBloc = sl<InboxBloc>();
        inboxBloc.add(const InboxLoadMessagesEvent());
        return inboxBloc;
      },
      child: BlocBuilder<InboxBloc, InboxState>(
        builder: (context, state) {
          if (state is InboxInitialState || state is InboxLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is InboxLoadedState) {
            return ListView.builder(
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                final message = state.messages[index];
                return ListTile(
                  title: Text(message.subject),
                  subtitle: Text(message.sender),
                );
              },
            );
          } else if (state is InboxErrorState) {
            return const Center(child: Text('Error loading messages'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
