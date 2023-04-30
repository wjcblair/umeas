// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:connectivity_plus/connectivity_plus.dart';

import 'i_network_info_contract.dart';

class NetworkInfo implements INetworkInfoContract {
  final Connectivity connectionChecker;

  NetworkInfo({required this.connectionChecker});

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await connectionChecker.checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
