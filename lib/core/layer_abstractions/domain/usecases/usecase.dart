import 'package:dartz/dartz.dart';

import '../../../error/failures/app_failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppFailure, Type>> call(Params params);
}
