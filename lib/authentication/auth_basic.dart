import 'package:flutter/foundation.dart';

class BasicAuth with ChangeNotifier {
  static const String _username = 'raushan';
  static const String _password = 'raushan';

  
  Future<bool> verifyUser ({@required String username,@required String password}) async {
  print("Verify Called");
   return await Future.delayed(Duration(milliseconds:5000), () {
      if (username == _username && password == _password) {
        return true;
      }
      return false;
    });
  }
}
