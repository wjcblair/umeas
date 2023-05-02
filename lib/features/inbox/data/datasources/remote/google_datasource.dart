import 'package:umeas/features/inbox/data/datasources/remote/i_inbox_remote_datasource_contract.dart';
import 'package:umeas/features/inbox/data/models/message_model.dart';

class GoogleDatasource implements IInboxRemoteDatasourceContract {
  @override
  Future<List<MessageModel>> fetchMessages() {
    // TODO: implement fetchMessages
    throw UnimplementedError();
  }
}
