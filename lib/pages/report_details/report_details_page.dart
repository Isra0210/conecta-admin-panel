import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportDetailsPage extends StatefulWidget {
  const ReportDetailsPage({Key? key}) : super(key: key);

  static const route = '/report-details';

  @override
  State<ReportDetailsPage> createState() => _ReportDetailsPageState();
}

class _ReportDetailsPageState extends State<ReportDetailsPage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 34),
      ChartData('Others', 52)
    ];

    final List<SalesData> salesData = [
      SalesData(DateTime(2010), 35),
      SalesData(DateTime(2011), 28),
      SalesData(DateTime(2012), 34),
      SalesData(DateTime(2013), 32),
      SalesData(DateTime(2014), 40)
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
      body: Row(
        children: [
          Center(
            child: SfCircularChart(
              series: <CircularSeries>[
                // Render pie chart
                PieSeries<ChartData, String>(
                    dataSource: chartData,
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y)
              ],
            ),
          ),
          Expanded(
            child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(),
                series: <ChartSeries>[
                  // Renders line chart
                  LineSeries<SalesData, DateTime>(
                      dataSource: salesData,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales)
                ]),
          ),
          SfCircularChart(series: <CircularSeries>[
            // Renders radial bar chart
            RadialBarSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y)
          ])
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
