import 'package:dartz/dartz.dart';

import '../../../error/failures/i_failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<IFailure, Type>> call(Params params);
}
