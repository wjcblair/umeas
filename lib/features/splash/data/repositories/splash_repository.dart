import 'package:umeas/features/splash/data/datasources/i_splash_local_datasource.dart';
import 'package:umeas/features/splash/domain/entities/splash.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions/cache_exception.dart';
import '../../../../core/error/failures/cache_failure.dart';
import '../../../../core/error/failures/general_failure.dart';
import '../../../../core/error/failures/i_failure.dart';
import '../../domain/repositories/i_splash_repository_contract.dart';

class SplashRepository implements ISplashRepositoryContract {
  final ISplashLocalDataSource _splashLocalDataSource;

  SplashRepository(this._splashLocalDataSource);

  @override
  Future<Either<IFailure, Splash>> getSplash() async {
    try {
      // Attempt to get model from assets
      final splashModel = await _splashLocalDataSource.getModel();
      // Cache the model
      await _splashLocalDataSource.cacheModel(splashModel);

      return Right(splashModel);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.toString()));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
