import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:umeas/app/umeas_app.dart';

import '../config/config_reader.dart';
import '../env/environment.dart';
import 'core/presentation/colors/color_manager.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;

Future<void> mainCommon(Environment env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Load the JSON config into memory
  await ConfigReader.initialize();

  // ignore: unused_local_variable
  MaterialColor primaryColor;
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
      primaryColor = ColorManager.createMaterialColor(Colors.blue);
      enableLogging = true;
      performanceOptimization = false;
      enableAnalytics = false;
      environmentName = 'Development';
      break;
    case Environment.prod:
      primaryColor = ColorManager.createMaterialColor(Colors.red);
      enableLogging = true;
      enableLogging = false;
      performanceOptimization = true;
      enableAnalytics = true;
      environmentName = 'Production';
      break;
  }

  // inject dependencies
  await di.init();

  runApp(UmeasApp());
}
