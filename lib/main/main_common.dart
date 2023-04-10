import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umeas/app/umeas_app.dart';

import '../config/config_reader.dart';
import '../env/environment.dart';

Future<void> mainCommon(Environment env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();
  // Load the JSON config into memory
  await ConfigReader.initialize();

  Color primaryColor;
  switch (env) {
    case Environment.dev:
      primaryColor = Colors.blue;
      break;
    case Environment.prod:
      primaryColor = Colors.red;
      break;
  }

  // Set up logging based on the configuration
  if (ConfigReader.enableLogging) {
    // Initialize your logging system, e.g., set up a logger
  } else {
    // Disable logging or use a no-op logger
  }

  // Set up performance optimization based on the configuration
  if (ConfigReader.performanceOptimization) {
    // Enable performance optimization features, e.g., set up a custom image cache
  } else {
    // Use default performance settings
  }

  // Set up analytics based on the configuration
  if (ConfigReader.enableAnalytics) {
    // Initialize your analytics system, e.g., set up Firebase Analytics
  } else {
    // Disable analytics or use a no-op analytics system
  }

  runApp(
    Provider.value(
      value: primaryColor,
      child: UmeasApp(),
    ),
  );
}
