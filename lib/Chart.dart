import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class Chart {
  double _value;
  Size _chatSize;
  GlobalKey<AnimatedCircularChartState> _chartKey;
  List<CircularStackEntry> _chartData = [];

  Chart(
      {double initialValue,
      Size chartSize,
      GlobalKey<AnimatedCircularChartState> chartKey}) {
    this._chartKey = chartKey;
    this._chatSize = chartSize;
    this._value = initialValue;
  }

  List<CircularStackEntry> generateChart(
      {double value, Color dialColor, String rankKey1, String rankKey2}) {
    List<CircularStackEntry> circularStackEntry = [
      CircularStackEntry(<CircularSegmentEntry>[
        CircularSegmentEntry(value, dialColor, rankKey: rankKey1)
      ], rankKey: rankKey2)
    ];

    _chartData = circularStackEntry;

    return _chartData;
  }

  Widget animatedCircularChart({
    double value,
    Color dialColor,
    String rankKey1,
    String rankKey2,
    CircularChartType chartType,
    SegmentEdgeStyle edgeStyle,
    bool percentageValue,
    String holeLabel,
    TextStyle lableStyle,
//        double holeRadius
  }) {
    return (AnimatedCircularChart(
      key: _chartKey,
      size: _chatSize,
      initialChartData: generateChart(
        value: _value,
        dialColor: dialColor,
        rankKey1: rankKey1,
        rankKey2: rankKey2,
      ),
      chartType: chartType,
      edgeStyle: edgeStyle,
      percentageValues: percentageValue,
      holeLabel: holeLabel,
//      holeRadius: holeRadius,
      labelStyle: lableStyle,
    ));
  }
}
