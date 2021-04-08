import 'package:flutter/material.dart';
import 'package:iotalarm/data/models/Setting.dart';
import 'package:iotalarm/data/repositories/SettingSharedPref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingNotifier extends ChangeNotifier{
  String _localUrl,_globalUrl ;

  void changeSocketSetting({localUrl,globalUrl}) async{
    print("Change socket setting called  $localUrl $globalUrl");
    _localUrl = localUrl;
    _globalUrl = globalUrl;
    SharedPreferences preferences  = await  SettingSharedPref().getPerf();
    preferences.setString('socket_local_url', _localUrl);
    preferences.setString('socket_global_url', _globalUrl);
    notifyListeners();
  }

  Future<Setting> getSettings() async{
    SharedPreferences preferences = await SettingSharedPref().getPerf();
    _localUrl = preferences.getString('socket_local_url');
    _globalUrl = preferences.getString('socket_global_url');
    return Setting(_globalUrl, _localUrl);
  }

}