import 'package:equatable/equatable.dart';

abstract class AppFailure extends Equatable {
  final String message;

  const AppFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => '$runtimeType Failure: $message';
}

const String kUnexpectedFailureMessage = 'Unexpected Failure';
