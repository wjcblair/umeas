import 'package:umeas/core/data/exceptions/server_exception.dart';
import 'package:umeas/core/network/i_network_info_contract.dart';
import 'package:umeas/features/auth/domain/entities/email_provider.dart';
import 'package:umeas/features/inbox/data/datasources/local/i_inbox_local_datasource_contract.dart';
import 'package:umeas/features/inbox/data/datasources/remote/i_inbox_remote_datasource_contract.dart';
import 'package:umeas/features/inbox/data/models/message_model.dart';
import 'package:umeas/features/inbox/domain/entities/message.dart';
import 'package:umeas/core/domain/failures/app_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:umeas/features/inbox/domain/repositories/i_inbox_repository_contract.dart';

import '../../../../core/data/exceptions/cache_exception.dart';
import '../../../../core/domain/failures/cache_failure.dart';
import '../../../../core/domain/failures/server_failure.dart';
import '../../domain/failures/inbox_failures.dart';

class InboxRepository implements IInboxRepositoryContract {
  final IInboxLocalDatasourceContract localDatasource;
  final IInboxRemoteDatasourceContract googleDatasource;
  final IInboxRemoteDatasourceContract microsoftDatasource;

  final INetworkInfoContract networkInfo;

  InboxRepository({
    required this.localDatasource,
    required this.googleDatasource,
    required this.microsoftDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<AppFailure, List<Message>>> fetchMessages(
      EmailProvider provider) async {
    if (await networkInfo.isConnected) {
      try {
        List<MessageModel> messages;

        switch (provider) {
          case EmailProvider.google:
            messages = await googleDatasource.fetchMessages();
            break;
          case EmailProvider.microsoft:
            messages = await microsoftDatasource.fetchMessages();
            break;
          case EmailProvider.unknown:
            return Left(UnknownEmailProviderFailure());
        }

        localDatasource.cacheMessages(messages);
        return Right(messages);
      } on Exception {
        return Left(ServerFailure());
      }
    } else {
      try {
        final messages = await localDatasource.fetchMessages();
        return Right(messages);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
