import 'i_exception.dart';

class ServerException extends IException {
  const ServerException({required String message}) : super(message: message);
}
