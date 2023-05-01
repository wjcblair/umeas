import 'package:umeas/features/inbox/domain/entities/credentials.dart';

class CredentialsModel extends Credentials {
  CredentialsModel({required super.email, required super.password});

  factory CredentialsModel.fromJson(Map<String, dynamic> json) {
    return CredentialsModel(
      email: json['email'],
      password: json['password'],
    );
  }
}
