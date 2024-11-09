import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final ValueNotifier<bool> isConnected = ValueNotifier(true);

  ConnectivityService() {
    _initialize();
  }

  void _initialize() {
    // Adjusting to handle a list if it is indeed expected
    _connectivity.onConnectivityChanged.listen((dynamic result) {
      if (result is List<ConnectivityResult> && result.isNotEmpty) {
        _handleConnectivityChange(result.first); // Use the first result if it's a list
      } else if (result is ConnectivityResult) {
        _handleConnectivityChange(result); // Handle the case when it’s a single result
      }
    });
  }

  Future<void> _handleConnectivityChange(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      isConnected.value = false;
    } else {
      // Check actual internet access using InternetConnectionChecker
      isConnected.value = await InternetConnectionChecker().hasConnection;
    }
  }

  Future<void> checkInitialConnection() async {
    isConnected.value = await InternetConnectionChecker().hasConnection;
  }
}
