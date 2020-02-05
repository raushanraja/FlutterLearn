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
  int dataFromSecondFile;
  String firstFile = "saved.txt";
  String secondFile = "saved2.txt";
  // For local documnents

  // Step 1. Get Document Directory which only Current App can assess
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Step 2. Create a reference to file location
  Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    print(File('$path/$fileName'));
    return File('$path/$fileName');
  }

  // Step 3. Method to add data to file and save it
  Future<File> writeToFile(int counter, String fileName) async {
    final file = await _localFile(fileName);
    return file.writeAsString('$counter');
  }

  // Step 4. Method to read data from the file
  Future<int> readFromFile(String fileName) async {
    try {
      final file = await _localFile(fileName);
      String content = await file.readAsString();
      return int.tryParse(content);
    } catch (e) {
      print("Error Occured in reading the file: $e");
    }
  }

  // Step 5. Method to copy the file to other file
  Future<File> copyFile(String fileName1, String fileName2) async {
    final file1 = await _localFile(fileName1);
    final path = await _localPath;
    return file1.copy('$path/$fileName2');
  }

  void _incrementCounter(String fileName) {
    setState(() {
      _counter++;
    });
    writeToFile(_counter, fileName);
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
            Text("Data from firstfile is: $dataFromFile"),
            FlatButton(
              child: Icon(Icons.directions_railway),
              onPressed: () async {
                int data = await readFromFile(firstFile);
                setState(() {
                  dataFromFile = data;
                });
              },
            ),
            Text("Data from secondfile is: $dataFromSecondFile"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    await copyFile(firstFile, secondFile);
                  },
                  icon: Icon(Icons.save),
                  label: Text("copy file"),
                ),
                FlatButton.icon(
                  onPressed: () async {
                    int data = await readFromFile(secondFile);
                    setState(() {
                      dataFromSecondFile = data;
                    });
                  },
                  icon: Icon(Icons.get_app),
                  label: Text("Read Data"),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(firstFile),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
