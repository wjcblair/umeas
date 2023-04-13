import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {
  final String message;

  const IFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => '$runtimeType Failure: $message';
}
