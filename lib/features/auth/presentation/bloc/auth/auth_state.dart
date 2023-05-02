part of 'auth_bloc.dart';

abstract class AuthState {
  final bool isLoading;
  final String? loadingText;
  const AuthState({
    required this.isLoading,
    this.loadingText = 'Please wait a moment',
  });
}

class AuthInitialState extends AuthState {
  const AuthInitialState({required bool isLoading})
      : super(
          isLoading: isLoading,
        );
}

class AuthRegisteringState extends AuthState {
  final AppFailure? failure;
  const AuthRegisteringState({
    required this.failure,
    required isLoading,
  }) : super(
          isLoading: isLoading,
        );
}

class AuthForgotPasswordState extends AuthState {
  final AppFailure? failure;
  final bool hasSentEmail;
  const AuthForgotPasswordState({
    required this.failure,
    required this.hasSentEmail,
    required bool isLoading,
  }) : super(
          isLoading: isLoading,
        );
}

class AuthLoggedInState extends AuthState {
  final AuthUser user;
  final EmailProvider emailProvider;
  const AuthLoggedInState({
    required this.user,
    required bool isLoading,
    required this.emailProvider,
  }) : super(
          isLoading: isLoading,
        );
}

class AuthNeedsVerificationState extends AuthState {
  const AuthNeedsVerificationState({required bool isLoading})
      : super(
          isLoading: isLoading,
        );
}

class AuthLoggedOutState extends AuthState with EquatableMixin {
  final AppFailure? failure;
  const AuthLoggedOutState({
    required this.failure,
    required bool isLoading,
    String? loadingText,
  }) : super(
          isLoading: isLoading,
          loadingText: loadingText,
        );

  @override
  List<Object?> get props => [failure, isLoading];
}
