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
  // ignore: unused_local_variable
  bool enableLogging;
  // ignore: unused_local_variable
  bool performanceOptimization;
  // ignore: unused_local_variable
  bool enableAnalytics;
  // ignore: unused_local_variable
  String environmentName;

  switch (env) {
    case Environment.dev:
      primaryColor = Colors.blue;
      enableLogging = true;
      performanceOptimization = false;
      enableAnalytics = false;
      environmentName = 'Development';
      break;
    case Environment.prod:
      primaryColor = Colors.red;
      enableLogging = false;
      performanceOptimization = true;
      enableAnalytics = true;
      environmentName = 'Production';
      break;
  }

  runApp(
    Provider.value(
      value: primaryColor,
      child: UmeasApp(),
    ),
  );
}
