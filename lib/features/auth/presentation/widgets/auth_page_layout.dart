import 'package:flutter/material.dart';
import 'package:umeas/core/assets/image_assets.dart';
import 'package:umeas/core/presentation/colors/color_manager.dart';

class AuthPageLayout extends StatelessWidget {
  final Widget child;

  const AuthPageLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          children: <Widget>[
            const SizedBox(height: 30.0),
            Image.asset(
              ImageAssets.kUmeasVerbosePath,
              height: 100.0,
              width: 100.0,
            ),
            const SizedBox(height: 65.0),
            Container(
              decoration: BoxDecoration(
                color:
                    ColorManager.umGreen, // Change this to your desired color
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: child,
              ),
            ),
            // add copy right and terms and conditions
          ],
        ),
      ),
    );
  }
}
