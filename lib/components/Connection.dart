import 'package:flutter/material.dart';

import '../classes/mqtt.dart';

class Connection extends StatelessWidget {
  Connection(
      {@required this.mqttConnect,
      @required this.label,
      @required this.icon,
      @required this.buttonColor,
      this.initialize});
  final String label;
  final IconData icon;
  final Color buttonColor;
  final MqttConnect mqttConnect;
  final Function initialize;

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        color: buttonColor,
        onPressed: () {
          label == "Connect"
              ? !mqttConnect.isConnected()
                  ? initialize()
                  : print("Already Connected")
              : mqttConnect.isConnected()
                  ? mqttConnect.disconnect()
                  : print("Already Disconnected");
        },
        icon: Icon(icon),
        label: Text(label));
  }
}
