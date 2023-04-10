import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/home.dart';

class UmeasApp extends StatelessWidget {
  const UmeasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CI with Codemagic',
      theme: ThemeData(
        primarySwatch: Provider.of<MaterialColor>(context),
      ),
      home: const HomePage(title: 'Flutter CI with Flavors!'),
    );
  }
}
