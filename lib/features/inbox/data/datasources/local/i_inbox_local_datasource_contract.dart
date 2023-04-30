import '../../models/message_model.dart';

abstract class IInboxLocalDatasourceContract {
  Future<List<MessageModel>> fetchMessages();
  Future<void> cacheMessages(List<MessageModel> emails);
}
