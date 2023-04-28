import 'package:equatable/equatable.dart';

abstract class AppFailure extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppFailure && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}
