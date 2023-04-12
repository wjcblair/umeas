import 'package:equatable/equatable.dart';

class Splash extends Equatable {
  final String imagePath;

  const Splash({required this.imagePath});

  @override
  List<Object?> get props => [imagePath];
}
