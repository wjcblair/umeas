import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/presentation/colors/app_colors.dart';
import '../core/presentation/styles/app_text_styles.dart';

class DesignTokensReader {
  static Map<String, dynamic>? _tokens;

  static Future<void> initialize() async {
    final configString = await rootBundle.loadString('tokens/tokens.json');
    _tokens = json.decode(configString) as Map<String, dynamic>;

    AppColors.setSysColors(await setSysColors());
    AppTextStyles.setSysTextStyles(await setSysTextStyles());
  }

  static Future<Map<String, Color>> setSysColors() async {
    final sysColorsJson =
        _tokens!['umeas']['md']['sys']['color'] as Map<String, dynamic>;

    Map<String, Color> sysColors = {};
    sysColorsJson.forEach((key, val) {
      final colorReferencePath = val['value'] as String;
      final refColor = extractReferenceKey(colorReferencePath);
      final referenceColorValue =
          _tokens!['umeas']['md']['ref']['color'][refColor]['value'] as String;

      sysColors[key] = AppColors.colorFromHex(referenceColorValue);
    });

    return sysColors;
  }

  static Future<Map<String, TextStyle>> setSysTextStyles() async {
    final sysTextStylesJson =
        _tokens!['umeas']['md']['sys']['typescale'] as Map<String, dynamic>;

    Map<String, TextStyle> sysTextStyles = {};
    sysTextStylesJson.forEach((key, val) {
      final textstyleReferencePath = val['value'] as String;
      final refTextStyle = extractReferenceKey(textstyleReferencePath);
      print(refTextStyle);
      final referenceTextStyleValue = _tokens!['umeas']['md']['ref']
          ['typescale'][refTextStyle]['value'] as Map<String, dynamic>;
      sysTextStyles[key] =
          AppTextStyles.textStyleFromJson(referenceTextStyleValue);
    });

    return sysTextStyles;
  }
}

String extractReferenceKey(String input) {
  final RegExp regExp = RegExp(r'\{md\.ref\.[^}]*\.([^}]+)\}');
  final Match? match = regExp.firstMatch(input);

  if (match != null && match.groupCount >= 1) {
    return match.group(1)!;
  } else {
    throw FormatException('Invalid reference format: $input');
  }
}
