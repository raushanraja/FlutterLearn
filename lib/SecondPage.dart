import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => new _SecondState();
}

class _SecondState extends State<Second> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  final _chartSize = const Size(200.0, 200.0);

  double value = 50.0;
  Color labelColor = Colors.blue[200];

  void _increment(x) {
    setState(() {
      value += x;
      List<CircularStackEntry> data = _generateChartData(value);
      _chartKey.currentState.updateData(data);
    });
  }

  void _decrement(x) {
    setState(() {
      value -= x;
      List<CircularStackEntry> data = _generateChartData(value);
      _chartKey.currentState.updateData(data);
    });
  }

  void showEffect() {
    Random rng = new Random();
    int x;
    int y = 0;
    Timer.periodic(Duration(seconds: 1), (times) {
      if (y == 0) {
        print("Runnig at interval 5 sec and x = $x");
        x = rng.nextInt(16);
        _increment(x);
        y = 1;
        setState(() {
          if (value >= 100) {
            value -= 50;
          }
        });
      } else {
        print("Runnig at interval 5 sec and x = $x");
        x = rng.nextInt(16);
        _decrement(x);
        y = 0;
        setState(() {
          if (value <= 0) {
            value += 50;
          }
        });
      }
    });
  }

  List<CircularStackEntry> _generateChartData(double value) {
    Color dialColor = Colors.blue[200];
    if (value <= 0) {
      dialColor = Colors.redAccent;
    } else if (value < 20) {
      dialColor = Colors.red[900];
    } else if (value < 30) {
      dialColor = Colors.yellow[900];
    } else if (value > 40 && value < 59) {
      dialColor = Colors.greenAccent;
    } else if (value > 60) {
      dialColor = Colors.blueGrey;
    }
    labelColor = dialColor;

    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(
            value,
            dialColor,
            rankKey: 'percentage',
          )
        ],
        rankKey: 'percentage',
      ),
    ];

    if (value > 100) {
      labelColor = Colors.green[200];

      data.add(new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(
            value - 100,
            Colors.green[200],
            rankKey: 'percentage',
          ),
        ],
        rankKey: 'percentage2',
      ));
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _labelStyle = Theme.of(context)
        .textTheme
        .title
        .merge(new TextStyle(color: labelColor));

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Percentage Dial'),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            child: new AnimatedCircularChart(
              key: _chartKey,
              size: _chartSize,
              initialChartData: _generateChartData(value),
              chartType: CircularChartType.Radial,
              edgeStyle: SegmentEdgeStyle.round,
              percentageValues: true,
              holeLabel: '$value%',
              labelStyle: _labelStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new RaisedButton(
                onPressed: showEffect,
                child: const Icon(Icons.remove),
                shape: const CircleBorder(),
                color: Colors.red[200],
                textColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
