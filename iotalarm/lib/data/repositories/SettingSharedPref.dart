import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SettingSharedPref{
  factory SettingSharedPref() {
    if(_singleton == null){
      _singleton = SettingSharedPref._();
    }
    return _singleton;
  }
  SettingSharedPref._();

  static SettingSharedPref _singleton;
  static Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Future<SharedPreferences> getPerf() async{
    return await _pref;
  }

}