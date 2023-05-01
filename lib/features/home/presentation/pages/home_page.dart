import 'package:flutter/material.dart';
import 'package:umeas/core/presentation/widgets/base_page.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
        title: 'HOME',
        child: Center(
          child: Text('Home Page Content'),
        ));
  }
}
