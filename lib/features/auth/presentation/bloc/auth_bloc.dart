import 'package:bloc/bloc.dart';
import 'package:umeas/core/error/failures/app_failure.dart';
import 'package:umeas/core/layer_abstractions/presentation/bloc/feature_event.dart';
import 'package:umeas/features/auth/domain/usecases/get_current_user.dart/get_current_user.dart';
import 'package:umeas/features/auth/domain/usecases/initialize/initialize.dart';
import 'package:umeas/features/auth/domain/usecases/login/login.dart';
import 'package:umeas/features/auth/domain/usecases/login_with_google/login_with_google.dart';
import 'package:umeas/features/auth/domain/usecases/logout/logout.dart';
import 'package:umeas/features/auth/domain/usecases/password_reset/email_param.dart';
import 'package:umeas/features/auth/domain/usecases/password_reset/reset_password.dart';
import 'package:umeas/features/auth/domain/usecases/verify_email/verify_email.dart';

import '../../../../core/layer_abstractions/domain/usecases/noparams.dart';
import '../../../../core/layer_abstractions/presentation/bloc/feature_state.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/usecases/core/auth_user_params.dart';
import '../../domain/usecases/register/register.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Initialize initialize;
  final GetCurrentUser getCurrentUser;
  final Login login;
  final LoginWithGoogle loginWithGoogle;
  final Logout logout;
  final ResetPassword resetPassword;
  final Register register;
  final VerifyEmail verifyEmail;

  AuthBloc({
    required this.initialize,
    required this.getCurrentUser,
    required this.login,
    required this.loginWithGoogle,
    required this.logout,
    required this.resetPassword,
    required this.register,
    required this.verifyEmail,
  }) : super(const AuthUninitializedState(isLoading: true)) {
    // Initialize
    on<AuthInitializeEvent>((event, emit) async {
      print("initializing event");
      final initializeOrFailure = await initialize(NoParams());
      await initializeOrFailure.fold(
        (failure) async {
          emit(const AuthLoggedOutState(failure: null, isLoading: false));
        },
        (initialize) async {
          final userOrFailure = await getCurrentUser(NoParams());
          userOrFailure.fold(
            (failure) {
              emit(const AuthLoggedOutState(failure: null, isLoading: false));
            },
            (user) {
              if (user.isEmailVerified == false) {
                emit(const AuthNeedsVerificationState(isLoading: false));
              } else {
                emit(AuthLoggedInState(user: user, isLoading: false));
              }
            },
          );
        },
      );
    });

    // Log in
    on<AuthLogInEvent>((event, emit) async {
      print('login event');
      emit(const AuthLoggedOutState(isLoading: true, failure: null));
      final authUserOrFailure = await login(
          AuthUserParams(email: event.email, password: event.password));
      emit(authUserOrFailure.fold(
        (failure) => AuthLoggedOutState(isLoading: false, failure: failure),
        (authUser) => AuthLoggedInState(user: authUser, isLoading: false),
      ));
    });

    on<AuthLogInWithGoogleEvent>((event, emit) async {
      print('login with google event');
      final logInWithGoogleOrFailure = await loginWithGoogle(NoParams());
      return logInWithGoogleOrFailure.fold(
        (failure) {
          // Handle the failure case if needed
        },
        (authUser) {
          // Handle the success case if needed
        },
      );
    });

    // Log out
    on<AuthLogOutEvent>((event, emit) async {
      print("received logout event");
      final logOutOrFailure = await logout(NoParams());
      emit(logOutOrFailure.fold(
        (failure) => AuthLoggedOutState(
          failure: failure,
          isLoading: false,
        ),
        (logout) => const AuthLoggedOutState(
          failure: null,
          isLoading: false,
        ),
      ));
    });

    // Should register
    on<AuthShouldRegisterEvent>((event, emit) async {
      print("should register event");
      emit(const AuthRegisteringState(failure: null, isLoading: false));
    });

    // Register
    on<AuthRegisterEvent>((event, emit) async {
      print("register event");
      emit(const AuthRegisteringState(isLoading: true, failure: null));
      final registerOrFailure = await register(
          AuthUserParams(email: event.email, password: event.password));
      emit(registerOrFailure.fold(
        (failure) => AuthRegisteringState(isLoading: false, failure: failure),
        (register) => const AuthNeedsVerificationState(isLoading: false),
      ));
    });

    // Forgot password
    on<AuthForgotPasswordEvent>((event, emit) async {
      print("forgot password event");
      emit(const AuthForgotPasswordState(
          isLoading: false, hasSentEmail: false, failure: null));
      final email = event.email;
      if (email.isEmpty) {
        return;
      }
      emit(const AuthForgotPasswordState(
          isLoading: true, hasSentEmail: false, failure: null));
      final resetPasswordOrFailure =
          await resetPassword(EmailParam(email: email));
      emit(resetPasswordOrFailure.fold(
        (failure) => AuthForgotPasswordState(
            isLoading: false, hasSentEmail: false, failure: failure),
        (resetPassword) => const AuthForgotPasswordState(
            isLoading: false, hasSentEmail: true, failure: null),
      ));
    });

    // Send email verification
    on<AuthSendEmailVerificationEvent>((event, emit) async {
      print("send email verification event");
      final verifyEmailorFailure = await verifyEmail(NoParams());
      emit(verifyEmailorFailure.fold(
        (failure) => state, // Re-emit the current state
        (verifyEmail) => state, // Re-emit the current state
      ));
    });
  }
}
