import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_flow/login/LoginPage.dart';
import 'package:provider/provider.dart';
import 'authentication/Firebase_Auth.dart';
import 'authentication/auth_basic.dart';
import 'constants/widget.dart';

// 
class Counter with ChangeNotifier {
  int value = 0;
  void increment() {
    value += 1;
    notifyListeners();
  }
}

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
        ChangeNotifierProvider(create: (context) => BasicAuth()),
        ChangeNotifierProvider(create: (context) => Auth())
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: Provider.of<Auth>(context).getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.error != null) {
              print("error");
              return Text(snapshot.error.toString());
            }
            return snapshot.hasData ? MyHomePage(title:'hello') : LoginPage();
          }
           else {
            return loaderWidget();
          }
        },
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<Counter>(
                builder: (context, counter, child) => Text('${counter.value}')),
            FlatButton(onPressed: (){
              Provider.of<Auth>(context,listen: false).logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            }, child: Text("Logout"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
