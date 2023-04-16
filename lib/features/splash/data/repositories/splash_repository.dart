import 'package:umeas/features/splash/data/datasources/i_splash_local_datasource.dart';
import 'package:umeas/features/splash/domain/entities/splash.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions/cache_exception.dart';
import '../../../../core/error/failures/cache_failure.dart';
import '../../../../core/error/failures/general_failure.dart';
import '../../../../core/error/failures/app_failure.dart';
import '../../domain/repositories/i_splash_repository_contract.dart';

class SplashRepository implements ISplashRepositoryContract {
  final ISplashLocalDataSourceContract localDataSource;

  SplashRepository({required this.localDataSource});

  @override
  Future<Either<AppFailure, Splash>> getSplash() async {
    try {
      // Attempt to get model from assets
      final splashModel = await localDataSource.getModel();
      // Cache the model
      await localDataSource.cacheModel(splashModel);

      return Right(splashModel);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.toString()));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
