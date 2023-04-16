import '../../../../../core/layer_abstractions/domain/usecases/params.dart';

class EmailParam extends Params {
  final String email;

  EmailParam({required this.email});

  @override
  List<Object> get props => [email];
}
