import '../../models/message_model.dart';
import 'i_inbox_remote_datasource_contract.dart';

class MicrosoftDatasource implements IInboxRemoteDatasourceContract {
  @override
  Future<List<MessageModel>> fetchMessages() {
    // TODO: implement fetchMessages
    throw UnimplementedError();
  }
}
