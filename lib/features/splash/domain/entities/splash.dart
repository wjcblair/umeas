import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Splash extends Equatable {
  final AssetImage image;
  final int delay;
  final String nextRoute;

  const Splash(
      {required this.nextRoute, required this.delay, required this.image});

  @override
  List<Object?> get props => [image, delay, nextRoute];
}
