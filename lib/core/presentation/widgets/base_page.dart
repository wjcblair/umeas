import 'package:flutter/material.dart';
import 'package:umeas/core/presentation/colors/app_colors.dart';
import 'package:umeas/core/presentation/widgets/top_app_bar.dart';

class BasePage extends StatelessWidget {
  final String title;
  final Widget child;

  const BasePage({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopAppBar(title: title),
      body: child,
    );
  }
}
