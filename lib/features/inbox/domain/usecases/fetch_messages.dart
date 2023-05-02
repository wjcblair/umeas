import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:umeas/features/inbox/domain/repositories/i_inbox_repository_contract.dart';

import '../../../../core/domain/failures/app_failure.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../auth/domain/entities/email_provider.dart';
import '../entities/message.dart';

class FetchMessages implements UseCase<List<Message>, FetchMessagesParams> {
  final IInboxRepositoryContract repository;

  FetchMessages({required this.repository});

  @override
  Future<Either<AppFailure, List<Message>>> call(
      FetchMessagesParams params) async {
    return await repository.fetchMessages(params.emailProvider);
  }
}

class FetchMessagesParams extends Equatable {
  final EmailProvider emailProvider;

  const FetchMessagesParams({required this.emailProvider});

  @override
  List<Object> get props => [emailProvider];
}
