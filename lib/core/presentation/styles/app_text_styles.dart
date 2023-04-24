import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppTextStyles {
  static late Map<String, String> _refTextStyles;
  static late Map<String, TextStyle> _sysTextStyles;

  static void setRefTextStyles(Map<String, String> textStyles) {
    _refTextStyles = textStyles;
  }

  static void setSysTextStyles(Map<String, TextStyle> textStyles) {
    _sysTextStyles = textStyles;
  }

  static Map<String, String> get refTextStyles => _refTextStyles;
  static Map<String, TextStyle> get sysTextStyles => _sysTextStyles;

  static final TextStyle headline1 = _sysTextStyles['headline1']!;
  static final TextStyle headline2 = _sysTextStyles['headline2']!;
  static final TextStyle headline3 = _sysTextStyles['headline3']!;
  static final TextStyle headline4 = _sysTextStyles['headline4']!;
  static final TextStyle headline5 = _sysTextStyles['headline5']!;
  static final TextStyle headline6 = _sysTextStyles['headline6']!;
  static final TextStyle regularLink = _sysTextStyles['regular-link']!;
  static final TextStyle specialLink = _sysTextStyles['special-link']!;
  static final TextStyle paragraph = _sysTextStyles['paragraph']!;
  static final TextStyle mutedText = _sysTextStyles['muted-text']!;
  static final TextStyle captionHelper = _sysTextStyles['caption-helper']!;
  static final TextStyle breadcrumbs = _sysTextStyles['breadcrumbs']!;
  static final TextStyle micro = _sysTextStyles['micro']!;

  static TextStyle textStyleFromJson(Map<String, dynamic> json) {
    final fontFamily = json['fontFamily'] as String;
    final fontWeightString = json['fontWeight'] as String;
    final lineHeight =
        double.parse((json['lineHeight'] as String).replaceAll("px", ""));
    final fontSize =
        double.parse((json['fontSize'] as String).replaceAll("px", ""));
    final letterSpacing =
        double.parse((json['letterSpacing'] as String).replaceAll("%", ""));

    FontWeight fontWeight;

    switch (fontWeightString) {
      case 'Regular':
        fontWeight = FontWeight.w400;
        break;
      case 'Medium':
        fontWeight = FontWeight.w500;
        break;
      case 'Semibold':
        fontWeight = FontWeight.w600;
        break;
      // ... other cases ...
      default:
        fontWeight = FontWeight.w400;
    }

    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      height: lineHeight / fontSize,
      fontSize: fontSize,
      letterSpacing: letterSpacing / 100,
      decoration: TextDecoration.none,
      color: AppColors.surfaceVariant,
    );
  }
}
