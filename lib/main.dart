import 'package:flutter/material.dart';
import 'package:sqflite_db/db_helper.dart';
import 'package:sqflite_db/models/school_info.dart';
import 'package:sqflite_db/screens/admission_screen.dart';

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icons.account_box,
                    label: "Admission",
                    screen: AdmissionScreen(),
                  ),
                  // Expanded(child: ,),
                  // Expanded(child: ,),
                ],
              )
            ]),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final String label;
  final icon;
  final screen;

  IconButton(
      {@required this.icon, @required this.label, @required this.screen});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton.icon(
        icon: Icon(icon),
        label: Text(label),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ),
          );
        },
      ),
    );
  }
}
