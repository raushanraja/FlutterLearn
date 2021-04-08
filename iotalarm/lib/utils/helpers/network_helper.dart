import 'package:connectivity/connectivity.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class NetworkHelper {
  Future<ConnectivityResult> checkConnection() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult;
  }

  Future<Map> wifi() async {
    String wifiName;
    String wifiBssid;
    String wifiIP;
    if (await checkConnection() == ConnectivityResult.wifi) {
      wifiName = await WifiInfo().getWifiName();
      wifiBssid = await WifiInfo().getWifiBSSID();
      wifiIP = await WifiInfo().getWifiIP();

      print(wifiName);
      print(wifiBssid);
      print(wifiIP);

    }
    return {
      'wifiName': wifiName,
      'wifiIP': wifiIP,
      'wifiBssid': wifiBssid
    };

  }
}
