import 'package:flutter/foundation.dart';
import 'package:iotui/constants.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityService with ChangeNotifier {
  ConnectivityStatus connectivityStatus;
  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectivityStatus = _getStatusFromResult(result);
      notifyListeners();
    });
  }

Future<String> wifiDetails() async{
  String name =await Connectivity().getWifiName();
  String ip =await Connectivity().getWifiIP();
  String bssid =await Connectivity().getWifiBSSID();
  LocationAuthorizationStatus status = await Connectivity().getLocationServiceAuthorization();
  return  name??" " + ip + " "+bssid;
  }


  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}
