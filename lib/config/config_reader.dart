import 'dart:convert';
import 'package:flutter/services.dart';

abstract class ConfigReader {
  static Map<String, dynamic>? _config;

  static Future<void> initialize() async {
    final configString = await rootBundle.loadString('config/app_config.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String get environmentName => _config?['environmentName'] as String;

  static bool get enableLogging => _config?['enableLogging'] as bool;

  static bool get performanceOptimization =>
      _config?['performanceOptimization'] as bool;

  static bool get enableAnalytics => _config?['enableAnalytics'] as bool;
}
