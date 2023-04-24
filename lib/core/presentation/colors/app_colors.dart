import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static late Map<String, Color> _sysColors;

  static void setSysColors(Map<String, Color> colors) {
    _sysColors = colors;
  }

  static Map<String, Color> get sysColors => _sysColors;

  static Color colorFromHex(String hexColor) {
    final String hex = hexColor.replaceFirst('#', '');
    final int length = hex.length;
    if (length == 6) {
      return Color(int.parse(hex, radix: 16) + 0xFF000000);
    } else if (length == 8) {
      return Color(int.parse(hex, radix: 16));
    } else {
      throw ArgumentError('Invalid color format: $hexColor');
    }
  }

  // white
  static const Color white = Colors.white;

  // primary
  static final Color primary = _sysColors['primary']!;
  static final Color onPrimary = _sysColors['on-primary']!;
  static final Color primaryContainer = _sysColors['primary-container']!;
  static final Color onPrimaryContainer = _sysColors['on-primary-container']!;

  // secondary
  static final Color secondary = _sysColors['secondary']!;
  static final Color onSecondary = _sysColors['on-secondary']!;
  static final Color secondaryContainer = _sysColors['secondary-container']!;
  static final Color onSecondaryContainer =
      _sysColors['on-secondary-container']!;

  // tertiary
  static final Color tertiary = _sysColors['tertiary']!;
  static final Color onTertiary = _sysColors['on-tertiary']!;
  static final Color tertiaryContainer = _sysColors['tertiary-container']!;
  static final Color onTertiaryContainer = _sysColors['on-tertiary-container']!;

  // surface
  static final Color surface = _sysColors['surface']!;
  static final Color onSurface = _sysColors['on-surface']!;
  static final Color surfaceContainer = _sysColors['surface-container']!;
  static final Color onSurfaceContainer = _sysColors['on-surface-container']!;

  // surface variant
  static final Color surfaceVariant = _sysColors['surface-variant']!;
  static final Color onSurfaceVariant = _sysColors['on-surface-variant']!;
  static final Color surfaceVariantContainer =
      _sysColors['surface-variant-container']!;
  static final Color onSurfaceVariantContainer =
      _sysColors['on-surface-variant-container']!;

  // error
  static final Color error = _sysColors['error']!;
  static final Color onError = _sysColors['on-error']!;
  static final Color errorContainer = _sysColors['error-container']!;
  static final Color onErrorContainer = _sysColors['on-error-container']!;

  // success
  static final Color success = _sysColors['success']!;
  static final Color onSuccess = _sysColors['on-success']!;
  static final Color successContainer = _sysColors['success-container']!;
  static final Color onSuccessContainer = _sysColors['on-success-container']!;
}
