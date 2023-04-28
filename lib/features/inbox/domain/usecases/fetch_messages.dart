import 'package:dartz/dartz.dart';
import 'package:umeas/features/inbox/domain/repositories/i_inbox_repository_contract.dart';

import '../../../../core/domain/failures/app_failure.dart';
import '../../../../core/domain/usecases/noparams.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/message.dart';

class FetchMessages implements UseCase<List<Message>, NoParams> {
  final IInboxRepositoryContract repository;

  FetchMessages({required this.repository});

  @override
  Future<Either<AppFailure, List<Message>>> call(NoParams params) async {
    return await repository.fetchMessages();
  }
}
