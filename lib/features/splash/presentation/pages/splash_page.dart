import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/screen_constants.dart';
import '../../../../injection_container.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';

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
                  return Center(
                    child: SizedBox(
                      width:
                          ScreenConstants.instance.displayWidth(innerContext) *
                              0.5,
                      height:
                          ScreenConstants.instance.displayHeight(innerContext) *
                              0.5,
                      child: Image(
                        image: state.splashLogo,
                      ),
                    ),
                  );
                } else if (state is Error) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  );
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
