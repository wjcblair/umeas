import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/home.dart';

// ignore: use_key_in_widget_constructors
class UmeasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CI with Codemagic',
      theme: ThemeData(
        primarySwatch: Provider.of<MaterialColor>(context),
      ),
      home: const HomePage(
        title: 'Flutter CI with Flavors!',
        key: null,
      ),
    );
  }
}
