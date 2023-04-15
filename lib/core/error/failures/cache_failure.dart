import 'i_failure.dart';

class CacheFailure extends IFailure {
  const CacheFailure({required String message}) : super(message: message);
}

const String kCacheFailureMessage = 'Cache Failure';
