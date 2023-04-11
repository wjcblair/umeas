import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:umeas/core/colors/color_manager.dart';
import 'package:umeas/features/home/presentation/pages/home_page.dart';
import 'package:umeas/features/splash/presentation/pages/splash_page.dart';

void main() {
  late SplashPage sut;

  setUp(() {
    sut = const SplashPage(
      title: 'Splash Page',
    );
  });

  group('Splash screen tests', () {
    testWidgets(
      "Splash screen displays the logo",
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(MaterialApp(home: sut));

        // Act
        final logoFinder = find.byType(Image);
        // Assert
        expect(logoFinder, findsOneWidget);
      },
    );

    testWidgets(
      "Splash screen navigates to the next page after a delay",
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(MaterialApp(
          home: sut,
          routes: {
            '/onboarding': (BuildContext context) => const HomePage(
                  title: 'Home Page',
                ),
          },
        ));

        // Act
        await tester.pump(const Duration(
            seconds: 3)); // Replace 3 with your actual splash screen duration.
        await tester.pumpAndSettle();

        // Assert
        expect(find.byType(HomePage), findsOneWidget);
      },
    );
  });
}
