import 'package:flutter/services.dart';
import 'dart:convert';

abstract class ConfigReader {
  static Map<String, dynamic>? _config;

  static Future<void> initialize() async {
    final configString = await rootBundle.loadString('config/app_config.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static int get incrementAmount => _config?['incrementAmount'] as int;
  static String get secretKey => _config?['secretKey'] as String;
}
