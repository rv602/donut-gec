import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Grocery', 25, Color.fromRGBO(232, 241, 77, 1)),
      ChartData('Medical', 38, Color.fromRGBO(106, 166, 174, 1)),
      ChartData('Food', 34, Color.fromRGBO(218, 227, 138, 1)),
      ChartData('Fuel', 52, Color.fromRGBO(13, 65, 74, 1)),
      ChartData('Others', 52, Color.fromARGB(141, 31, 220, 50)),
    ];
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCircularChart(series: <CircularSeries>[
      // Renders doughnut chart
      DoughnutSeries<ChartData, String>(
        dataSource: chartData,
        pointColorMapper: (ChartData data, _) => data.color,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
        // cornerStyle: CornerStyle.bothCurve,
        // radius: '50%',
        // startAngle: 360,
        // endAngle: 360,
        // pointColorMapper: (ChartData data, _) => data.color,
        // groupMode: CircularChartGroupMode.point,
        // groupTo: 2,
      )
    ]))));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color? color;
}
