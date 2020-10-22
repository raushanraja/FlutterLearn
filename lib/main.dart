import 'dart:math';


import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CustomPainter Example'),
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
  int _filledAngle = 0;
  Random random = new Random();

  void changeFilledAngle(){
    int randomAngle = random.nextInt(361) + 1;
    print(randomAngle);
    setState(() {
          _filledAngle = randomAngle;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: [
            Center(child: CustomPaint(painter: Circle())),
            Center(child: CustomPaint(painter: CircleDark(filledAngle: _filledAngle))),
            Center(
                child: Icon(
              Icons.check,
              color: _filledAngle>=300 ? Colors.red[400]:Colors.red[100],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.track_changes_sharp),
        onPressed: (){
          changeFilledAngle();
        },
      ),
    );
  }
}

class Circle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.red[100]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawCircle(Offset(0, 0), 20, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CircleDark extends CustomPainter {
  final filledAngle;

  CircleDark({@required this.filledAngle});

  @override
  void paint(Canvas canvas, Size size) {
    var paint2 = Paint()
      ..color = Colors.red[400]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(Rect.fromCircle(center: Offset.zero, radius: 20),
        -math.pi / 2, math.pi * filledAngle / 180, false, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
