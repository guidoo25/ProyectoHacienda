import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MyPieChart extends StatelessWidget {
  final Map<String, double> dataMap;

  const MyPieChart({required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      chartRadius: MediaQuery.of(context).size.width / 2,
      chartType: ChartType.disc,
      legendOptions: LegendOptions(
        showLegendsInRow: true,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        decimalPlaces: 1,
      ),
    );
  }
}
