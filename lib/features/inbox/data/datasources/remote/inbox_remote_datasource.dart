import 'dart:convert';
import 'dart:io';

import 'package:umeas/features/inbox/data/datasources/remote/i_inbox_remote_datasource_contract.dart';
import 'package:umeas/features/inbox/data/models/message_model.dart';

import '../exceptions/inbox_exceptions.dart';

class InboxRemoteDatasource implements IInboxRemoteDatasourceContract {
  @override
  Future<List<MessageModel>> fetchMessages() async {
    try {
      return [];
    } on SocketException {
      throw NoInternetConnectionException();
    } catch (e) {
      throw GenericInboxException(e.toString());
    }
  }
}
