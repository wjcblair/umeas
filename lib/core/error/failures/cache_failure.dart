import 'app_failure.dart';

class CacheFailure extends AppFailure {
  const CacheFailure({required String message}) : super(message: message);
}

const String kCacheFailureMessage = 'Cache Failure';
