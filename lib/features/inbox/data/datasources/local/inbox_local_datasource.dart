import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:umeas/features/inbox/data/datasources/local/i_inbox_local_datasource_contract.dart';
import 'package:umeas/features/inbox/data/models/message_model.dart';

class InboxLocalDatasource implements IInboxLocalDatasourceContract {
  final SharedPreferences sharedPreferences;
  static const String emailMessagesKey = 'EMAIL_MESSAGES';

  InboxLocalDatasource({required this.sharedPreferences});

  @override
  Future<void> cacheMessages(List<MessageModel> emails) async {
    final encodedEmails =
        json.encode(emails.map((email) => email.toJson()).toList());
    await sharedPreferences.setString(emailMessagesKey, encodedEmails);
  }

  @override
  Future<List<MessageModel>> fetchMessages() async {
    final encodedEmails = sharedPreferences.getString(emailMessagesKey);
    if (encodedEmails != null) {
      final List<dynamic> decodedEmails = json.decode(encodedEmails);
      return decodedEmails
          .map((email) => MessageModel.fromJson(email))
          .toList();
    } else {
      return [];
    }
  }
}
