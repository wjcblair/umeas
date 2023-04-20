// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:umeas/core/presentation/bloc/feature_state.dart';

abstract class SplashState extends FeatureState {
  const SplashState();
}

class Initial extends SplashState {}

class Loading extends SplashState {
  final AssetImage splashLogo;

  const Loading({required this.splashLogo});
}

class Loaded extends SplashState {
  final String nextRoute;

  const Loaded({required this.nextRoute});
}

class Error extends SplashState {
  final String message;
  const Error({required this.message});
}
