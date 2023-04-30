import 'dart:convert';
import 'dart:io';

import 'package:umeas/features/inbox/data/datasources/remote/i_inbox_remote_datasource_contract.dart';
import 'package:umeas/features/inbox/data/models/message_model.dart';
import 'package:enough_mail/enough_mail.dart';

import '../../models/credentials_model.dart';
import '../exceptions/inbox_exceptions.dart';

class InboxRemoteDatasource implements IInboxRemoteDatasourceContract {
  @override
  Future<List<MessageModel>> fetchMessages() async {
    try {
      try {
        // Your code here
      } catch (e) {
        print('Error: $e');
      }
      final jsonString =
          await File('credentials/credentials.json').readAsString();
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      final credentials = CredentialsModel.fromJson(jsonMap);
      final email = credentials.email;
      final password = credentials.password;
      print('Parsed email: ${email}');
      print('Parsed password: ${password}');

      final config = await Discover.discover(email);
      print('Discovered mail server settings: $config');
      final account = MailAccount.fromDiscoveredSettings(
          'my account', email, password, config!);
      final mailClient = MailClient(account, isLogEnabled: true);

      await mailClient.connect();
      await mailClient.selectInbox();
      final messages = await mailClient.fetchMessages(count: 10);

      // Disconnect from the mail server
      await mailClient.disconnect();

      // Convert the fetched MimeMessages to EmailModels
      final emailModels = messages
          .map((message) => MessageModel.fromMimeMessage(message))
          .toList();

      return emailModels;
    } on MailException {
      throw MailingException();
    } on SocketException {
      throw NoInternetConnectionException();
    } catch (e) {
      throw GenericInboxException(e.toString());
    }
  }
}
