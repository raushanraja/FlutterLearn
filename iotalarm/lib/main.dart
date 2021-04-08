import 'package:flutter/material.dart';
import 'package:iotalarm/utils/helpers/network_helper.dart';
import 'package:iotalarm/utils/ui/custom_colors.dart';
import 'package:iotalarm/widgets/socketSettings.dart';
import 'data/services/socket_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IOT Alarm App',
      theme: ThemeData(
        primarySwatch: CustomColors.info,
      ),
      home: MyHomePage(title: 'Alarm'),
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
  final WSocketManager socket =
      WSocketManager(URL: 'https://4c2e62b6ea21.ngrok.io');
  final NetworkHelper _networkHelper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    setState(() {
      socket.connect();
    });
    return Scaffold(
      backgroundColor: CustomColors.cpone['grey'],
      body: SafeArea(
        child: StreamBuilder(
          stream: socket.streamSocket.getResponse,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            print(snapshot);
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SocketSettings(),
                ),
                // Text("${snapshot.data??'No Activity'}"),
                // SizedBox(
                //   height: 200,
                //   width: 200,
                //   child: TextField(
                //     onChanged: (text) {
                //       print("First text field: $text");
                //     },
                //   ),
                // ),
                IconButton(
                    icon: Icon(Icons.web),
                    onPressed: () {
                      _networkHelper.checkConnection();
                      _networkHelper.wifi();
                      // print("Button Pressed ${socket.socket.connected}",);
                    }),
                // IconButton(
                //     icon: Icon(Icons.web),
                //     onPressed: () {
                //       print(socket.disconnect());
                //     }),
                // IconButton(
                //     icon: Icon(Icons.web),
                //     onPressed: () {
                //       socket.socket.open();
                //     })
              ],
            );
          },
        ),
      ),
    );
  }
}
