import 'package:basic_app/classes/Chart.dart';
import 'package:basic_app/classes/mqtt.dart';
import 'package:basic_app/components/Connection.dart';
import 'package:basic_app/components/WeatherMeter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:mqtt_client/mqtt_client.dart';
import '../constants.dart';
class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  //  Chart Config Start
  static final GlobalKey<AnimatedCircularChartState> chartKey =
      GlobalKey<AnimatedCircularChartState>();
  static final Size chartSize = Size(200, 200);
  Chart tempChart =
      Chart(initialValue: 10, chartKey: chartKey, chartSize: chartSize);

  void _increment(x) {
    setState(() {
      _value += x;
      List<CircularStackEntry> data = tempChart.generateChart(
          value: _value,
          dialColor: Colors.red,
          rankKey1: "percentage",
          rankKey2: "percentage");
      chartKey.currentState.updateData(data);
    });
  }

  void _setValue(x) {
    setState(() {
      _value = x;
      if (x <= 15) {
        _display = kColor0;
      } else if (x > 15 && x <= 25) {
        _display = kColor1;
      } else if (x > 25 && x <= 35) {
        _display = kColor2;
      } else if (x > 35 && x <= 40) {
        _display = kColor3;
      } else if (x > 40 && x <= 50) {
        _display = kColor4;
      } else if (x > 50 && x <= 65) {
        _display = kColor5;
      } else if (x > 65) {
        _display = kColor6;
      }

      List<CircularStackEntry> data = tempChart.generateChart(
          value: _value,
          dialColor: _display,
          rankKey1: "percentage",
          rankKey2: "percentage");
      chartKey.currentState.updateData(data);
    });
  }

//   Chart Config End

//  MQTT Config Start
  MqttConnect mqttConnect = MqttConnect(
    serverUrl: kMqttSetver,
    username: kUserName,
    password: kPassword,
    keepAlivePeriod: kKeepALivePeriod,
  );

  void _onConnected(MqttClient client, bool isConnected) {
    isConnected = true;
    if (isConnected) {
      setState(() {
        message = "Connected";
      });
    }
    client.subscribe('test/iot', MqttQos.atMostOnce);
    client.subscribe('test/reply', MqttQos.atMostOnce);
    client.subscribe('test/sim', MqttQos.atLeastOnce);
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload;
      final String _message =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      final String _topic = c[0].topic;
      if (_topic == "test/sim") {
        _setValue(double.parse(_message));
      } else {
        setState(() {
          message = _message;
        });
      }
    });
  }

  void _onDisconnected() {
    setState(() {
      message = "Disconnected";
    });
  }

  void initializeConnect() {
    mqttConnect.configureMqtt();
    mqttConnect.connect(_onConnected, _onDisconnected);
  }

//  MQTT Config End

//  State Variables
  String message = "Disconnected";
  Color _display = Colors.white;
  double _value = 10;
  bool _ledSwitch = false;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("MQTT APP"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Current Status",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
//                FlatButton.icon(
//                    onPressed: () {
//                      mqttConnect.publish0();
//                    },
//                    icon: Icon(Icons.exposure_zero),
//                    label: Text("Send Zero")),
//                FlatButton.icon(
//                    onPressed: () {
//                      mqttConnect.publish1();
//                    },
//                    icon: Icon(Icons.looks_one),
//                    label: Text("Send One")),
                Text(
                  "Toggle LED",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Switch(
                  value: _ledSwitch,
                  onChanged: (value) {
                    setState(() {
                      if (mqttConnect.isConnected()) {
                        _ledSwitch = value;
                        _ledSwitch
                            ? mqttConnect.publish1()
                            : mqttConnect.publish0();
                      } else {
                        message = "Not connected to broker";
                      }
                    });
                  },
                  activeColor: Colors.greenAccent,
                  inactiveThumbColor: Colors.redAccent,
                  inactiveTrackColor: Colors.red[900],
                ),
              ],
            ),
            WeatherMeter(
                tempChart: tempChart, value: _value, labelColor: _display),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Connection(
                    mqttConnect: mqttConnect,
                    icon: Icons.airplay,
                    label: "Connect",
                    buttonColor: Colors.green,
                    initialize: initializeConnect),
                Connection(
                    mqttConnect: mqttConnect,
                    icon: Icons.cancel,
                    buttonColor: Colors.red,
                    label: "Disconnect"),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
