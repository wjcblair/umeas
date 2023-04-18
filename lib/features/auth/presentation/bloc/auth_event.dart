part of 'auth_bloc.dart';

abstract class AuthEvent extends FeatureEvent {}

class AuthInitializeEvent extends AuthEvent {}

class AuthSendEmailVerificationEvent extends AuthEvent {}

class AuthLogInEvent extends AuthEvent {
  final String email;
  final String password;
  AuthLogInEvent({required this.email, required this.password});
}

class AuthLogInWithGoogleEvent extends AuthEvent {}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;
  AuthRegisterEvent({required this.email, required this.password});
}

class AuthShouldRegisterEvent extends AuthEvent {
  AuthShouldRegisterEvent();
}

class AuthForgotPasswordEvent extends AuthEvent {
  final String email;
  AuthForgotPasswordEvent({required this.email});
}

class AuthLogOutEvent extends AuthEvent {
  AuthLogOutEvent();
}
