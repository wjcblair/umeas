import 'package:flutter/material.dart';
import 'package:umeas/core/presentation/colors/app_colors.dart';
import 'package:umeas/core/presentation/themes/app_button_themes.dart';
import 'package:umeas/core/presentation/themes/app_text_themes.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      bottomAppBarTheme: BottomAppBarTheme(
        color: AppColors.secondary,
        elevation: 0,
      ),
      elevatedButtonTheme: AppButtonTheme.elevatedButton,
      textTheme: AppTextTheme.dmSansRobotoMajorThird,
      scaffoldBackgroundColor: AppColors.primary,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        // primary
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        // secondary
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        // tertiary
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        // surface
        surface: AppColors.surfaceVariant,
        onSurface: AppColors.onSurface,

        // surface variant
        surfaceVariant: AppColors.surfaceVariant,
        onSurfaceVariant: AppColors.onSurfaceVariant,

        // error
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,

        // background
        background: AppColors.surface,
        onBackground: AppColors.onSurface,
      ),
    );
  }
}
