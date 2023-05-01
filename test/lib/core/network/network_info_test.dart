// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:umeas/core/network/network_info.dart';

class MockConnectivity extends Mock implements Connectivity {}

void setupTest() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel('dev.fluttercommunity.plus/connectivity')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'check') {
      return 'wifi';
    }
    return null;
  });
}

void main() {
  // setupTest();

  late NetworkInfo networkInfo;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfo(connectionChecker: mockConnectivity);
  });

  group('isConnected', () {
    test('should return true when there is a wifi connection', () async {
      // arrange
      when(() => mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      // act
      final result = await networkInfo.isConnected;

      // assert
      verify(() => mockConnectivity.checkConnectivity());
      expect(result, true);
    });

    test('should return true when there is a mobile connection', () async {
      // arrange
      when(() => mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.mobile);

      // act
      final result = await networkInfo.isConnected;

      // assert
      verify(() => mockConnectivity.checkConnectivity());
      expect(result, true);
    });
  });
  group('isNotConnected', () {
    test('should return false when there is no connection', () async {
      // arrange
      when(() => mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);

      // act
      final result = await networkInfo.isConnected;

      // assert
      verify(() => mockConnectivity.checkConnectivity());
      expect(result, false);
    });
  });
}
