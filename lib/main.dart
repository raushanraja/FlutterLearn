import 'package:flutter/material.dart';
import 'package:flutter_ui_components/components/Login/login.dart';
import 'components/listTile/ListTile_screen.dart';
import 'package:flutter_ui_components/models/UIList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'UI Comps'),
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
  List<Uilist> uilist = Uilist.uilist;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: uilist.length,
        itemBuilder: (context,index){
          return ListTile(
            leading: Text('${uilist[index].uiNumber}'),
            title: Text('${uilist[index].uiName}'),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          );
        },
      ),
    );
  }
}
