import 'package:flutter/material.dart';
import 'package:singleChildScrollVue/size_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: spaceFromStatusbar(context),
        color: Colors.lightGreenAccent,
        child: Container(
          height: displayHeightStatusBarOnly(context),
          width: displayWidth(context),
          color: Colors.pink,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    color: Colors.greenAccent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FittedBox(
                    fit:BoxFit.contain,
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Name"),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
