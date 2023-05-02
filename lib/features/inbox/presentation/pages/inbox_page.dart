import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/features/inbox/presentation/bloc/inbox_bloc.dart';

import '../../../../injection_container.dart';
import '../../../auth/domain/entities/email_provider.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InboxBloc>(
      create: (context) {
        final inboxBloc = sl<InboxBloc>();
        return inboxBloc;
      },
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoggedInState) {
            if (state.emailProvider == EmailProvider.google) {
              context
                  .read<InboxBloc>()
                  .add(const InboxLoadMessagesWithGoogleApiEvent());
            } else if (state.emailProvider == EmailProvider.microsoft) {
              context
                  .read<InboxBloc>()
                  .add(const InboxLoadMessagesWithMicrosoftApiEvent());
            } else {
              context.read<InboxBloc>().add(const InboxNoMessagesToLoadEvent());
            }
          }
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
            } else if (state is InboxNoMessagesState) {
            } else if (state is InboxErrorState) {
              return const Center(child: Text('Error loading messages'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
