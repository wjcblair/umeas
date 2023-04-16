import 'package:firebase_auth/firebase_auth.dart' show User;

import '../../domain/entities/auth_user.dart';

class AuthUserModel extends AuthUser {
  const AuthUserModel({
    required String id,
    required String email,
    required String isEmailVerified,
  }) : super(
          id: id,
          email: email,
          isEmailVerified: isEmailVerified,
        );

  factory AuthUserModel.fromFirebase(User user) => AuthUserModel(
        id: user.uid,
        email: user.email!,
        isEmailVerified: user.emailVerified.toString(),
      );
}
