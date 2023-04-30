import 'package:flutter/material.dart';

class ScreenConstants {
  const ScreenConstants._internal();

  static const ScreenConstants instance = ScreenConstants._internal();

  factory ScreenConstants() => instance;

  Size _displaySize(BuildContext context) {
    debugPrint('Size = ${MediaQuery.of(context).size}');
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    debugPrint('Height = ${_displaySize(context).height}');
    return _displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    debugPrint('Width = ${_displaySize(context).width}');
    return _displaySize(context).width;
  }
}
