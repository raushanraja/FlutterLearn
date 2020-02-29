import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication/auth_basic.dart';

// Loader
Container loaderWidget() {
    return Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      decoration: TextDecoration.none
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
  }

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
        future: Provider.of<Auth>(context)
            .verifyUser(username: 'raushan', password: 'raushan'),
        builder: (context, snapshot) {
          Widget children;
          if (snapshot.hasData) {
            print(snapshot.data);
            children = MyHomePage(
              title: "Login App",
            );
          } else {
            children = loaderWidget();
          }
          return children;
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
