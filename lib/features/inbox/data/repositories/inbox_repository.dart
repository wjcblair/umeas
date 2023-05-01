import 'package:umeas/core/data/exceptions/server_exception.dart';
import 'package:umeas/core/network/i_network_info_contract.dart';
import 'package:umeas/features/inbox/data/datasources/local/i_inbox_local_datasource_contract.dart';
import 'package:umeas/features/inbox/data/datasources/remote/i_inbox_remote_datasource_contract.dart';
import 'package:umeas/features/inbox/domain/entities/message.dart';
import 'package:umeas/core/domain/failures/app_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:umeas/features/inbox/domain/repositories/i_inbox_repository_contract.dart';

import '../../../../core/data/exceptions/cache_exception.dart';
import '../../../../core/domain/failures/cache_failure.dart';
import '../../../../core/domain/failures/server_failure.dart';
import '../datasources/exceptions/inbox_exceptions.dart';

class InboxRepository implements IInboxRepositoryContract {
  final IInboxLocalDatasourceContract localDatasource;
  final IInboxRemoteDatasourceContract remoteDatasource;
  final INetworkInfoContract networkInfo;

  InboxRepository({
    required this.localDatasource,
    required this.remoteDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<AppFailure, List<Message>>> fetchMessages() async {
    if (await networkInfo.isConnected) {
      try {
        print('is connected');
        final messages = await remoteDatasource.fetchMessages();
        print('messages: $messages');
        localDatasource.cacheMessages(messages);
        return Right(messages);
      } on MailingException {
        return Left(ServerFailure());
      } on NoInternetConnectionException {
        return Left(ServerFailure());
      } on GenericInboxException {
        return Left(ServerFailure());
      }
    } else {
      print('is not connected');
      try {
        final messages = await localDatasource.fetchMessages();
        return Right(messages);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
