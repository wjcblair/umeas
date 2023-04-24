import 'package:flutter/material.dart';
import 'package:umeas/core/assets/image_assets.dart';
import 'package:umeas/core/presentation/colors/app_colors.dart';

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
            // const SizedBox(height: 30.0),
            // Image.asset(
            //   ImageAssets.kUmeasPath,
            //   height: 300.0,
            //   width: 300.0,
            // ),
            //const SizedBox(height: 65.0),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 3), // changes position of shadow
                    )
                  ],
                  // ColorManager.umGreen, // Change this to your desired color
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
