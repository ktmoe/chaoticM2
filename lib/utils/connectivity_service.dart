import 'dart:async';

import 'package:connectivity/connectivity.dart';

class ConnectivityService {
  final Stream<bool> connectivityStream =
      Connectivity().onConnectivityChanged.asyncMap(_convertToBool);

  // Since connecitivity service doesn't guarantee if network is really connected or not,
  // extra checking is mandatory
  static FutureOr<bool> _convertToBool(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
