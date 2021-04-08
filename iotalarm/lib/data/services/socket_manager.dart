import 'package:flutter/material.dart';
import 'dart:async';
import 'package:iotalarm/utils/helpers/stream_socket.dart';
import 'package:socket_io_client/socket_io_client.dart';

class WSocketManager {
  static final WSocketManager _instance = WSocketManager._internal();
  static final StreamSocket _streamSocket = StreamSocket();
  static String _url;
  Socket _socket;
  WSocketManager._internal();

  // Factory Constructor to  Initiate the Class only once
  factory WSocketManager({@required URL}) {
    _url = URL;
    return _instance;
  }

  Socket get socket => _socket;
  String get url => _url;
  StreamSocket get streamSocket => _streamSocket;

  void connect() {
    print("Connect Called");
    Socket socket =
        io(_url, OptionBuilder().setTransports(['websocket'])
        .disableReconnection()
        .build());
    socket.onConnect((_) => print("Socket Connected"));
    socket.on('message', (data) => streamSocket.addResponse(data));
    socket.onConnectError((data) => print(data));
    socket.onDisconnect((_) => print('disconnect'));
    socket.onError((data) => print(data));
    _socket = socket;
  }



  String disconnect() {
    if (_socket != null) {
      if (_socket.connected) {
        _socket.close();
        return "Socket disconnected";
      }
    }
    return "Socket not conencted";
  }
}
