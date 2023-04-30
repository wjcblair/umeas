import '../../models/message_model.dart';

abstract class IInboxRemoteDatasourceContract {
  Future<List<MessageModel>> fetchMessages();
}
