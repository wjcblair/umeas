// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:umeas/features/splash/constants/splash_constants.dart';
// import 'package:umeas/features/splash/presentation/bloc/splash_bloc.dart';
// import 'package:umeas/features/splash/presentation/bloc/splash_event.dart';
// import 'package:umeas/features/splash/presentation/bloc/splash_state.dart';
// import 'package:umeas/features/splash/presentation/pages/splash_page.dart';

// class MockSplashBloc extends MockBloc<SplashEvent, SplashState>
//     implements SplashBloc {}

// void main() {
//   late MockSplashBloc mockSplashBloc;
//   late SplashState loadingState;

//   setUp(() {
//     mockSplashBloc = MockSplashBloc();
//     const AssetImage tSplashLogo = AssetImage(SplashConstants.kLogo);
//     loadingState = const Loading(splashLogo: tSplashLogo);
//   });

  // group('SplashPage Tests', () {
  //   testWidgets('Renders SplashPage', (WidgetTester tester) async {
  //     // Arrange
  //     await tester.pumpWidget(const MaterialApp(home: SplashPage()));

  //     // Act

  //     // Assert
  //     expect(find.byType(SplashPage), findsOneWidget);
  //   });

  //   group('UI State Tests', () {
  //     testWidgets('Loading state displays correct UI elements',
  //         (WidgetTester tester) async {
  //       // Arrange
  //       when(() => mockSplashBloc.state).thenReturn(loadingState);
  //       await tester.pumpWidget(const MaterialApp(home: SplashPage()));

  //       // Act
  //       await tester.pump();

  //       // Assert
  //       expect(find.byType(Image), findsOneWidget);
  //     });

      // testWidgets('Error state displays correct UI elements',
      //     (WidgetTester tester) async {
      //   // Arrange
      //   when(mockSplashBloc.state)
      //       .thenReturn(const Error(message: 'Error occurred!'));
      //   await tester.pumpWidget(const MaterialApp(home: SplashPage()));

      //   // Act
      //   await tester.pump();

      //   // Assert
      //   expect(find.text('Error occurred!'), findsOneWidget);
      // });

      // testWidgets('Loaded state navigates to the correct next route',
      //     (WidgetTester tester) async {
      //   // Arrange
      //   when(mockSplashBloc.state)
      //       .thenReturn(const Loaded(nextRoute: '/nextRoute'));
      //   await tester.pumpWidget(MaterialApp(
      //     home: const SplashPage(),
      //     onGenerateRoute: (settings) {
      //       if (settings.name == '/nextRoute') {
      //         return MaterialPageRoute(builder: (context) => Container());
      //       }
      //       return null;
      //     },
      //   ));

      //   // Act
      //   await tester.pumpAndSettle();

      //   // Assert
      //   expect(find.byType(SplashPage), findsNothing);
      //   expect(find.byType(Container), findsOneWidget);
      // });
//     });
//   });
// }
