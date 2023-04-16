import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';
import '../widgets/splash_logo.dart';
import '../widgets/error_text.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<SplashBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final splashBloc = sl<SplashBloc>();
        splashBloc.add(InitializeSplash());
        return splashBloc;
      },
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is Loaded) {
            Navigator.of(context).pushReplacementNamed(state.nextRoute);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Builder(
              builder: (BuildContext innerContext) {
                if (state is Loading) {
                  return SplashLogo(splashLogo: state.splashLogo);
                } else if (state is Error) {
                  return ErrorText(message: state.message);
                } else {
                  return Container();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
