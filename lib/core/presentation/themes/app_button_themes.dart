import 'package:flutter/material.dart';
import 'package:umeas/core/presentation/resources/state_opacity.dart';
import 'package:umeas/core/presentation/styles/app_text_styles.dart';

import '../colors/app_colors.dart';
import '../resources/app_elevation.dart';

class AppButtonTheme {
  static ElevatedButtonThemeData get elevatedButton {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      disabledForegroundColor:
          AppColors.onSurface.withOpacity(StateOpacity.disabledText),
      disabledBackgroundColor:
          AppColors.onSurface.withOpacity(StateOpacity.disabled),
      shadowColor: Colors.black26,
      textStyle: AppTextStyles.headline6,
      elevation: 4,
      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ).copyWith(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.onSurface.withOpacity(StateOpacity.disabled);
          }
          if (states.contains(MaterialState.hovered)) {
            return AppColors.onPrimary.withOpacity(StateOpacity.hovered);
          }
          if (states.contains(MaterialState.focused)) {
            return AppColors.primary.withOpacity(StateOpacity.focused);
          }
          if (states.contains(MaterialState.pressed)) {
            return AppColors.onPrimary.withOpacity(StateOpacity.pressed);
          }
          return AppColors.primary;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.onSurface.withOpacity(StateOpacity.disabledText);
          }
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return AppColors.onPrimary;
          }
          return AppColors.white;
        },
      ),
      elevation: MaterialStateProperty.resolveWith<double>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppElevation.level0;
          }
          if (states.contains(MaterialState.hovered)) {
            return AppElevation.level2;
          }
          if (states.contains(MaterialState.focused)) {
            return AppElevation.level1;
          }
          if (states.contains(MaterialState.pressed)) {
            return AppElevation.level0;
          }
          return 4;
        },
      ),
    );

    return ElevatedButtonThemeData(
      style: buttonStyle,
    );
  }
}
