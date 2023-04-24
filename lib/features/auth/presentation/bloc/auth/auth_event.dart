part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthInitializeEvent extends AuthEvent {}

class AuthSendEmailVerificationEvent extends AuthEvent {}

class AuthLogInEvent extends AuthEvent {
  final String email;
  final String password;
  AuthLogInEvent(this.email, this.password);
}

class AuthLogInWithGoogleEvent extends AuthEvent {}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;
  AuthRegisterEvent(this.email, this.password);
}

class AuthShouldRegisterEvent extends AuthEvent {
  AuthShouldRegisterEvent();
}

class AuthForgotPasswordEvent extends AuthEvent {
  final String? email;
  AuthForgotPasswordEvent({this.email});
}

class AuthLogOutEvent extends AuthEvent {
  AuthLogOutEvent();
}
