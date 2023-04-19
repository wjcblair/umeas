import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:umeas/features/auth/data/datasources/remote/i_auth_remote_datasource.dart';

import '../../../../../firebase_options.dart';
import '../../models/auth_user_model.dart';
import '../exceptions/generic_exceptions.dart';
import '../exceptions/google_login_exceptions.dart';
import '../exceptions/login_exceptions.dart';
import '../exceptions/register_exceptions.dart';

class FirebaseAuthDatasource implements IAuthRemoteDatasourceContract {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  FirebaseAuthDatasource(
      {required this.firebaseAuth, required this.googleSignIn});

  @override
  AuthUserModel getCurrentUser() {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      return AuthUserModel.fromFirebase(user);
    } else {
      return throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> initialize() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } on FirebaseException {
      // Handle specific FirebaseException
      throw InitializationException();
    } catch (_) {
      // Handle all other exceptions
      throw GenericAuthException();
    }
  }

  @override
  Future<AuthUserModel> logIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = getCurrentUser();
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logOut() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      return await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw GoogleSignInCancelledException();
      }

      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );
      await firebaseAuth.signInWithCredential(authCredential);
    } on PlatformException catch (_) {
      throw GoogleSignInServerErrorException();
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<AuthUserModel> registerUser(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = getCurrentUser();
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseAuthException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      print("sending email verification");
      return await user.sendEmailVerification();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> sendPasswordReset({required String toEmail}) async {
    try {
      return await firebaseAuth.sendPasswordResetEmail(email: toEmail);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'firebase_auth/invalid-email':
          throw InvalidEmailAuthException();
        case 'firebase_auth/user-not-found':
          throw UserNotFoundAuthException();
        default:
          throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }
}
