import 'package:flutter/material.dart';
import 'package:umeas/core/presentation/styles/app_text_styles.dart';

class AppTextTheme {
  // text theme using DM Sans for headlines and Roboto for body
  // with a major third type scale
  static TextTheme get dmSansRobotoMajorThird {
    return TextTheme(
      displayLarge: AppTextStyles.headline1,
      displayMedium: AppTextStyles.headline2,
      displaySmall: AppTextStyles.headline3,
      headlineMedium: AppTextStyles.headline4,
      headlineSmall: AppTextStyles.headline5,
      titleLarge: AppTextStyles.headline6,
      titleMedium: AppTextStyles.regularLink,
      titleSmall: AppTextStyles.specialLink,
      bodyLarge: AppTextStyles.paragraph,
      bodyMedium: AppTextStyles.mutedText,
      bodySmall: AppTextStyles.captionHelper,
      labelSmall: AppTextStyles.breadcrumbs,
      // button: AppTextStyles.micro,
    );
  }
}
