import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportDetailsPage extends StatelessWidget {
  const ReportDetailsPage({Key? key}) : super(key: key);

  static const route = '/report-details';

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 34),
      ChartData('Others', 52)
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0XFF1e224c),
        centerTitle: true,
        title: const Text(
          "Relatório",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
          child: SfCircularChart(series: <CircularSeries>[
        // Render pie chart
        PieSeries<ChartData, String>(
            dataSource: chartData,
            pointColorMapper: (ChartData data, _) => data.color,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y)
      ])),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
