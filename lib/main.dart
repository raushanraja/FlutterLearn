import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
  int _counter = 0;
  int dataFromFile;
  // Step 1. Get Document Directory which only Current App can assess
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Step 2. Create a reference to file location
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/saved.txt');
  }

  // Step 3. Method to add data to file and save it
  Future<File> writeToFile(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }

  // Method to read data from the file
  Future<int> readFromFile() async {
    try {
      final file = await _localFile;
      String content = await file.readAsString();
      return int.tryParse(content);
    } catch (e) {
      print("Error Occured in reading the file: $e");
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    writeToFile(_counter);
  }

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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text("Data from file is: $dataFromFile"),
            FlatButton(
              child: Icon(Icons.directions_railway),
              onPressed: () async {
                int data = await readFromFile();
                setState(() {
                  dataFromFile = data;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
