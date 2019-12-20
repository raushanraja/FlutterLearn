import 'package:flutter/widgets.dart';
import 'package:typed_data/typed_data.dart' as tt;
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import './SecondPage.dart';
import './Chart.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

void main() => runApp(MyApp());

final MqttClient client = MqttClient('raushanraja.dev', '');

/// The subscribed callback
void onSubscribed(String topic) {
  print('EXAMPLE::Subscription confirmed for topic $topic');
}

/// The successful connect callback

/// Pong callback
void pong() {
  print('EXAMPLE::Ping response client callback invoked');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'MQTT APP'),
        '/second': (context) => Second(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final GlobalKey<AnimatedCircularChartState> chartKey =
      GlobalKey<AnimatedCircularChartState>();
  static final Size chartSize = Size(200, 200);
  Chart tempChart =
      Chart(initialValue: 10, chartKey: chartKey, chartSize: chartSize);
  bool _ledSwitch = false;
  String message = "Disconnected";
  String payload = "";
  final myController = TextEditingController();
  tt.Uint8Buffer fet(String str) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(str);
    return builder.payload;
  }

  double _value = 10;
  void onConnected() {
    print(
        'EXAMPLE::OnConnected client callback - Client connection was sucessful');
    setState(() {
      message = "Connected";
    });
  }

  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus.returnCode == MqttConnectReturnCode.solicited) {
      print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    }

    setState(() {
      message = "Disconnected";
    });
  }

  Future<int> mqttFunction() async {
    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.pongCallback = pong;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .authenticateAs('raushan', "y5&9P<:r68")
        .withClientIdentifier('Mqtt_MyClientUniqueId')
        .keepAliveFor(20) // Must agree with the keep alive set above or not set
        .withWillTopic(
            'willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    print('EXAMPLE::Mosquitto client connecting....');
    client.connectionMessage = connMess;

    /// Connect the client, any errors here are communicated by raising of the appropriate exception. Note
    /// in some circumstances the broker will just disconnect us, see the spec about this, we however will
    /// never send malformed messages.
    try {
      await client.connect();
    } on Exception catch (e) {
      print('EXAMPLE::client exception - $e');
      client.disconnect();
    }

    /// Check we are connected
    if (client.connectionStatus.state == MqttConnectionState.connected) {
      print('EXAMPLE::Mosquitto client connected');
    } else {
      /// Use status here rather than state if you also want the broker return code.
      print(
          'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
    }

    /// Ok, lets try a subscription
    print('EXAMPLE::Subscribing to the test/iot topic');
    const String topic = 'test/iot'; // Not a wildcard topic
    client.subscribe(topic, MqttQos.atMostOnce);
    client.subscribe('test/reply', MqttQos.atMostOnce);

    /// The client has a change notifier object(see the Observable class) which we then listen to to get
    /// notifications of published updates to each subscribed topic.
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload;
      final String pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      setState(() {
        message = pt;
      });

      /// The above may seem a little convoluted for users only interested in the
      /// payload, some users however may be interested in the received publish message,
      /// lets not constrain ourselves yet until the package has been in the wild
      /// for a while.
      /// The payload is a byte buffer, this will be specific to the topic
      print(
          'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });

    /// If needed you can listen for published messages that have completed the publishing
    /// handshake which is Qos dependant. Any message received on this stream has completed its
    /// publishing handshake with the broker.
    client.published.listen((MqttPublishMessage message) {
      print(
          'EXAMPLE::Published notification:: topic is ${message.variableHeader.topicName}, with Qos ${message.header.qos}');
    });

    /// Lets publish to our topic
    /// Use the payload builder rather than a raw buffer
    /// Our known topic to publish to
    const String pubTopic = 'test/iot';
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString('Hello from mqtt_client');

//    / Subscribe to it
    print('EXAMPLE::Subscribing to the Dart/Mqtt_client/testtopic topic');
    client.subscribe('test/reply', MqttQos.exactlyOnce);

    /// Publish it
//    print('EXAMPLE::Publishing our topic');
//    client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload);

    /// Ok, we will now sleep a while, in this gap you will see ping request/response
    /// messages being exchanged by the keep alive mechanism.
    print('EXAMPLE::Sleeping....');
    await MqttUtilities.asyncSleep(120);

    /// Finally, unsubscribe and exit gracefully
//  print('EXAMPLE::Unsubscribing');
//  client.unsubscribe(topic);

    /// Wait for the unsubscribe message from the broker if you wish.
//  await MqttUtilities.asyncSleep(2);
//  print('EXAMPLE::Disconnecting');
//  client.disconnect();
    return 0;
  }

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

  void _decrement(x) {
    setState(() {
      _value -= x;
      List<CircularStackEntry> data = tempChart.generateChart(
          value: _value,
          dialColor: Colors.red,
          rankKey1: "percentage",
          rankKey2: "percentage");
      chartKey.currentState.updateData(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "LED Control",
                      style: TextStyle(color: Colors.white70, fontSize: 15.0),
                    ),
                    Switch(
                      value: _ledSwitch,
                      onChanged: (value) {
                        setState(() {
                          if (client.connectionStatus.state ==
                              MqttConnectionState.connected) {
                            _ledSwitch = value;
                            _ledSwitch
                                ? client.publishMessage(
                                    'test/iot', MqttQos.exactlyOnce, fet('1'))
                                : client.publishMessage(
                                    'test/iot', MqttQos.exactlyOnce, fet('0'));
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
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    labelText: "Enter text to send",
                    labelStyle: TextStyle(color: Colors.white70),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Text(
                '$message',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    tempChart.animatedCircularChart(
                      value: _value,
                      dialColor: Colors.blueGrey,
                      rankKey1: "percentage",
                      rankKey2: "percenatge",
                      chartType: CircularChartType.Radial,
                      edgeStyle: SegmentEdgeStyle.round,
                      percentageValue: true,
                      holeLabel: "$_value%",
                      lableStyle: TextStyle(color: Colors.white70),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                              _increment(10);
                            },
                            color: Colors.blueGrey[600],
                            child: Icon(
                              Icons.add,
                              color: Colors.white70,
                            )),
                        FlatButton(
                            onPressed: () {
                              _decrement(10);
                            },
                            color: Colors.blueGrey[600],
                            child: Icon(
                              Icons.remove,
                              color: Colors.white70,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton.icon(
            onPressed: client.disconnect,
            icon: Icon(Icons.close),
            label: Text("Disconnect"),
            color: Colors.redAccent,
          ),
          FlatButton.icon(
              onPressed: mqttFunction,
              icon: Icon(Icons.airplay),
              label: Text("Connect"),
              color: Colors.yellowAccent),
          FlatButton.icon(
              onPressed: () {
                if (myController.text != "") {
                  payload = myController.text;
                  myController.text = "";
                  if (client.connectionStatus.state ==
                      MqttConnectionState.connected) {
                    client.publishMessage(
                        'test/iot', MqttQos.exactlyOnce, fet(payload));
                  } else {
                    setState(() {
                      message = "Not Connected to broker";
                    });
                  }
                } else {
                  setState(() {
                    message = "Enter a text to send";
                  });
                }
              },
              icon: Icon(Icons.send),
              label: Text("Send"),
              color: Colors.greenAccent)
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
