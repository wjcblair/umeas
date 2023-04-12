import 'package:dartz/dartz.dart';
import 'package:umeas/core/error/failures/failure.dart';
import 'package:umeas/core/usecases/usecase.dart';

import '../../../../core/usecases/params.dart';
import '../entities/splash.dart';
import '../repositories/splash_repository.dart';

class GetSplash implements UseCase<Splash, Params> {
  final ISplashRepository repository;

  GetSplash(this.repository);

  @override
  Future<Either<Failure, Splash>> call(Params params) async {
    return await repository.getSplash(params.data['imagePath'] as String);
  }
}
