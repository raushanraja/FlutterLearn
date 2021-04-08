import 'dart:async';
class StreamSocket {
  final _socketResponse = StreamController<String>();

  void addResponse(data) => _socketResponse.add(data);
  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}