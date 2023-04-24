import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:umeas/features/auth/data/datasources/remote/firebase_auth_provider.dart';
import 'package:umeas/features/auth/data/datasources/remote/i_auth_remote_datasource.dart';
import 'package:umeas/features/auth/data/repositories/auth_repository.dart';
import 'package:umeas/features/auth/domain/repositories/i_auth_repository_contract.dart';
import 'package:umeas/features/auth/domain/usecases/get_current_user.dart/get_current_user.dart';
import 'package:umeas/features/auth/domain/usecases/initialize/initialize.dart';
import 'package:umeas/features/auth/domain/usecases/login/login.dart';
import 'package:umeas/features/auth/domain/usecases/login_with_google/login_with_google.dart';
import 'package:umeas/features/auth/domain/usecases/logout/logout.dart';
import 'package:umeas/features/auth/domain/usecases/password_reset/reset_password.dart';
import 'package:umeas/features/auth/domain/usecases/register/register.dart';
import 'package:umeas/features/auth/domain/usecases/verify_email/verify_email.dart';
import 'package:umeas/features/splash/domain/repositories/i_splash_repository_contract.dart';

import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'features/splash/data/datasources/local/i_splash_local_datasource_contract.dart';
import 'features/splash/data/datasources/local/splash_local_datasource.dart';
import 'features/splash/data/repositories/splash_repository.dart';
import 'features/splash/domain/usecases/get_splash.dart';
import 'features/splash/presentation/bloc/splash_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //print('Initializing dependencies');
  initFeatures();
  initCore();
  initExternal();
}

// Features
void initFeatures() {
  //print('Initializing feature dependencies');
  initSplash();
  initAuth();
}

// Splash feature
initSplash() {
  //print('Initializing Splash feature dependencies');
  // Blocs
  sl.registerFactory(() => SplashBloc(getSplash: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetSplash(repository: sl()));

  // Repositories
  sl.registerLazySingleton<ISplashRepositoryContract>(
      () => SplashRepository(localDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<ISplashLocalDataSourceContract>(
      () => SplashLocalDataSource());
}

// Auth feature
initAuth() {
  //print('Initializing Auth feature dependencies');
  // Blocs
  sl.registerFactory(() => AuthBloc(
      initialize: sl(),
      getCurrentUser: sl(),
      login: sl(),
      loginWithGoogle: sl(),
      logout: sl(),
      resetPassword: sl(),
      register: sl(),
      verifyEmail: sl()));

  // Use cases
  sl.registerLazySingleton(() => Initialize(repository: sl()));
  sl.registerLazySingleton(() => GetCurrentUser(repository: sl()));
  sl.registerLazySingleton(() => Login(repository: sl()));
  sl.registerLazySingleton(() => Register(repository: sl()));
  sl.registerLazySingleton(() => LoginWithGoogle(repository: sl()));
  sl.registerLazySingleton(() => Logout(repository: sl()));
  sl.registerLazySingleton(() => ResetPassword(repository: sl()));
  sl.registerLazySingleton(() => VerifyEmail(repository: sl()));

  // Repositories
  sl.registerLazySingleton<IAuthRepositoryContract>(
      () => AuthRepository(remoteDatasource: sl()));

  // Data sources
  sl.registerLazySingleton<IAuthRemoteDatasourceContract>(
      () => FirebaseAuthDatasource(firebaseAuth: sl(), googleSignIn: sl()));
}

// Core
void initCore() {
  //print('Initializing core dependencies');
}

// External
void initExternal() {
  //print('Initializing external dependencies');
  // Firebase
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
}
