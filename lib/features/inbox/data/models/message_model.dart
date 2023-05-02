import '../../domain/entities/message.dart';

class MessageModel extends Message {
  const MessageModel(
      {required super.sender,
      required super.subject,
      required super.date,
      required super.body});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      sender: json['sender'],
      subject: json['subject'],
      date: DateTime.parse(json['date']),
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'subject': subject,
      'date': date.toIso8601String(),
      'body': body,
    };
  }
}
