import 'package:flutter/material.dart';
import 'package:iotui/constants.dart';
import 'package:iotui/utils/connectivity.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ConnectivityService())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FWCD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ConnectivityWidget(),
      ),
    );
  }
}

class ConnectivityWidget extends StatelessWidget {
  const ConnectivityWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityService>(
        builder: (context, connection, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${connection.connectivityStatus}'),
                connection.connectivityStatus == ConnectivityStatus.WiFi
                    ? FutureBuilder(future: connection.wifiDetails(),builder: (context,snapshot){
                      if (snapshot.hasData)return Text(snapshot.data.toString());
                      return Container(width: 0,height: 0);
                    })
                    : Text("")
              ],
            ));
  }
}
