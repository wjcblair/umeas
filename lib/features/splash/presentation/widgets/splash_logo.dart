import 'package:flutter/material.dart';
import '../../../../core/constants/screen_constants.dart';

class SplashLogo extends StatelessWidget {
  final AssetImage splashLogo;

  const SplashLogo({super.key, required this.splashLogo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: ScreenConstants.instance.displayWidth(context) * 0.5,
        height: ScreenConstants.instance.displayHeight(context) * 0.5,
        child: Image(image: splashLogo, fit: BoxFit.contain),
      ),
    );
  }
}
