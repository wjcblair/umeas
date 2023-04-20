import 'package:umeas/core/presentation/bloc/feature_event.dart';

abstract class SplashEvent extends FeatureEvent {}

class InitializeSplash extends SplashEvent {} // Triggered when the app starts
