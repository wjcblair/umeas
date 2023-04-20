import 'package:umeas/core/layer_abstractions/presentation/bloc/feature_event.dart';

abstract class SplashEvent extends FeatureEvent {}

class InitializeSplash extends SplashEvent {} // Triggered when the app starts
