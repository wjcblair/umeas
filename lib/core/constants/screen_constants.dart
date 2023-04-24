import 'package:flutter/material.dart';

class ScreenConstants {
  const ScreenConstants._internal();

  static const ScreenConstants instance = ScreenConstants._internal();

  factory ScreenConstants() => instance;

  Size displaySize(BuildContext context) {
    debugPrint('Size = ${MediaQuery.of(context).size}');
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    debugPrint('Height = ${displaySize(context).height}');
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    debugPrint('Width = ${displaySize(context).width}');
    return displaySize(context).width;
  }
}