import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/usecases/noparams.dart';
import '../../domain/usecases/get_splash.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetSplash getSplash;

  SplashBloc({required this.getSplash}) : super(Initial()) {
    on<InitializeSplash>(_onInitializeSplash);
  }

  Future<void> _onInitializeSplash(
      InitializeSplash event, Emitter<SplashState> emit) async {
    final splashOrFailure = await getSplash(NoParams());
    return splashOrFailure.fold(
      (failure) {
        emit(const Error(message: 'Error Initializing Splash'));
      },
      (splash) async {
        emit(Loading(splashLogo: splash.image));
        await Future.delayed(Duration(seconds: splash.delay));
        emit(Loaded(nextRoute: splash.nextRoute));
      },
    );
  }
}
