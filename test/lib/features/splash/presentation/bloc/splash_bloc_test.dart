// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:umeas/core/domain/usecases/noparams.dart';
// import 'package:umeas/features/splash/constants/splash_constants.dart';
// import 'package:umeas/features/splash/domain/entities/splash.dart';
// import 'package:umeas/features/splash/domain/usecases/get_splash.dart';
// import 'package:umeas/features/splash/presentation/bloc/splash_bloc.dart';
// import 'package:umeas/features/splash/presentation/bloc/splash_event.dart';
// import 'package:umeas/features/splash/presentation/bloc/splash_state.dart';

// class MockGetSplash extends Mock implements GetSplash {}

// class MockSplashBloc extends MockBloc<SplashEvent, SplashState>
//     implements SplashBloc {}

// void main() {
//   late MockGetSplash mockGetSplash;
//   late SplashBloc mockSplashBloc;
//   late AssetImage tSplashLogo;
//   late String tNextRoute;
//   late int tDelay = SplashConstants.kDelay;

//   setUp(() {
//     mockGetSplash = MockGetSplash();
//     mockSplashBloc = MockSplashBloc();
//     tSplashLogo = const AssetImage(SplashConstants.kLogo);
//     tNextRoute = SplashConstants.kNextRoute;
//   });

//   tearDown(() {
//     mockSplashBloc.close();
//   });

//   group('SplashBloc', () {
//     blocTest<SplashBloc, SplashState>(
//       'emits [Loading, Loaded] when InitializeSplash event is added',
//       build: () {
//         when(() => mockGetSplash(NoParams())).thenAnswer((_) async => Right(
//             Splash(image: tSplashLogo, delay: tDelay, nextRoute: tNextRoute)));
//         return SplashBloc(getSplash: mockGetSplash);
//       },
//       act: (bloc) => bloc.add(InitializeSplash()),
//       wait: Duration(seconds: tDelay * 2),
//       expect: () => [
//         Loading(splashLogo: tSplashLogo),
//         Loaded(nextRoute: tNextRoute),
//       ],
//     );

//     blocTest<SplashBloc, SplashState>(
//       'emits [Error] when InitializeSplash fails',
//       build: () {
//         when(() => mockGetSplash(NoParams())).thenAnswer((_) async =>
//             const Left(GeneralFailure(message: 'Test error message')));
//         return SplashBloc(getSplash: mockGetSplash);
//       },
//       act: (bloc) => bloc.add(InitializeSplash()),
//       expect: () => [
//         const Error(message: 'Test error message'),
//       ],
//     );
//   });
// }
