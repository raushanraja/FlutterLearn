import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/Chart.dart';

class WeatherMeter extends StatelessWidget {
  const WeatherMeter(
      {Key key,
      @required this.tempChart,
      @required double value,
      @required this.labelColor})
      : _value = value,
        super(key: key);

  final Chart tempChart;
  final double _value;
  final Color labelColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        tempChart.animatedCircularChart(
            value: _value,
            dialColor: Colors.blueGrey,
            rankKey1: "percentage",
            rankKey2: "percenatge",
            chartType: CircularChartType.Radial,
            edgeStyle: SegmentEdgeStyle.round,
            percentageValue: true,
            holeLabel: "$_value%",
            lableStyle: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: labelColor,
                fontSize: 25,
              ),
            )),
      ],
    );
  }
}
