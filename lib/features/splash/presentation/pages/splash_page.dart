import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/assets/image_assets.dart';
import '../../../../core/colors/color_manager.dart';
import '../../../../core/constants/screen_constants.dart';
import '../../../../core/routes/route_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required String title});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: SizedBox(
          width: ScreenConstants.instance.displayWidth(context) * 0.5,
          height: ScreenConstants.instance.displayHeight(context) * 0.5,
          child: const Image(
            image: AssetImage(ImageAssets.kSplashLogo),
          ),
        ),
      ),
    );
  }
}
