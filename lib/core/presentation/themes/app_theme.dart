import 'package:flutter/material.dart';
import 'package:umeas/core/presentation/colors/color_manager.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorManager.lightThemeUmGreen,
      colorScheme: 
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark
    );
  }
}
