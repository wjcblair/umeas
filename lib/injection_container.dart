import 'package:get_it/get_it.dart';
import 'package:umeas/features/splash/domain/repositories/i_splash_repository_contract.dart';

import 'features/splash/data/datasources/i_splash_local_datasource.dart';
import 'features/splash/data/datasources/splash_local_datasource.dart';
import 'features/splash/data/repositories/splash_repository.dart';
import 'features/splash/domain/usecases/get_splash.dart';
import 'features/splash/presentation/bloc/splash_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initFeatures();
  initCore();
  initExternal();
}

// Features
void initFeatures() {
  initSplash();
}

initSplash() {
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

// Core
void initCore() {}

// External
void initExternal() {}
