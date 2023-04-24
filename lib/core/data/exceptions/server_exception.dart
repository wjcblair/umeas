import 'app_exception.dart';

class ServerException extends AppException {
  const ServerException({required String message}) : super(message: message);
}
