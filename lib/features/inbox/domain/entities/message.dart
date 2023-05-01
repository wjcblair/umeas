import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String sender;
  final String subject;
  final DateTime date;
  final String body;

  const Message(
      {required this.sender,
      required this.subject,
      required this.date,
      required this.body});

  @override
  List<Object?> get props => [sender, subject, date, body];
}
