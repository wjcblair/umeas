import '../../models/auth_user_model.dart';

abstract class IAuthRemoteDatasourceContract {
  Future<void> initialize();
  AuthUserModel getCurrentUser();
  Future<AuthUserModel> logIn(
      {required String email, required String password});
  Future<void> logInWithGoogle();
  Future<AuthUserModel> registerUser(
      {required String email, required String password});
  Future<void> sendEmailVerification();
  Future<void> sendPasswordReset({required String toEmail});
  Future<void> logOut();
}
