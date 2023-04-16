import '../../../../../core/layer_abstractions/domain/usecases/params.dart';

class AuthUserParams extends Params {
  final String email;
  final String password;

  AuthUserParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
