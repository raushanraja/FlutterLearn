import 'package:flutter/material.dart';
import 'package:mqtt/theme.dart';
import 'package:mqtt/screens/view.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: View(),
    );
  }
}
