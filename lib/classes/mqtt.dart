import 'package:mqtt_client/mqtt_client.dart';
import 'package:typed_data/typed_data.dart' as tt;

class MqttConnect {
  String _serverUrl, _userName, _password, _message, _topic;
  int _keepAlivePeriod;
  bool _isConnected = false;
  MqttClient _client;
  Function _onConnected, _onDisconnected;
  MqttConnect(
      {String serverUrl,
      int keepAlivePeriod,
      String username,
      String password,
      Function onConnected,
      Function onDisconnected}) {
    _serverUrl = serverUrl;
    _keepAlivePeriod = keepAlivePeriod;
    _userName = username;
    _password = password;
  }

  tt.Uint8Buffer fet(String str) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(str);
    return builder.payload;
  }

  bool isConnected() => _isConnected;

  void disconnect() {
    _client.disconnect();
    _isConnected = false;
  }

  void publish0() {
    _client.publishMessage('test/iot', MqttQos.exactlyOnce, fet('0'));
  }

  void publish1() {
    _client.publishMessage('test/iot', MqttQos.exactlyOnce, fet('1'));
  }

  void _pongCallback() {
    print('EXAMPLE::Ping response client callback invoked');
  }

  void configureMqtt() {
    _client = MqttClient(_serverUrl, '');
    _client.logging(on: false);
    _client.keepAlivePeriod = _keepAlivePeriod;
    _client.pongCallback = _pongCallback;
// Setting Message to be sent when starting a connection
    final MqttConnectMessage connMess = MqttConnectMessage()
        .authenticateAs(_userName, _password)
        .withClientIdentifier("Arduino_WEMOS")
        .keepAliveFor(_keepAlivePeriod)
        .withWillTopic('willTopic')
        .withWillMessage('willMessage')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    _client.connectionMessage = connMess;
  }

  Future connect(Function onConnected, Function onDisconnected) async {
    _onConnected = onConnected;
    _onDisconnected = onDisconnected;
    // Initiating the connection
    try {
      await _client.connect();
      _isConnected = true;
      _client.onConnected = _onConnected(_client, _isConnected);
      _client.onDisconnected = _onDisconnected;
    } on Exception catch (e) {
      print('::client exception at connection - $e');
      _client.disconnect();
      _isConnected = false;
    }
  }
}
