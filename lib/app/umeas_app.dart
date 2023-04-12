import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/routes/route_manager.dart';

// ignore: use_key_in_widget_constructors
class UmeasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CI with Codemagic',
      theme: ThemeData(
        primarySwatch: Provider.of<MaterialColor>(context),
      ),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splash,
    );
  }
}
