import 'package:expensemanager/core/countyCode/page_country_list.dart';
import 'package:expensemanager/core/countyCode/model_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

class AnalyticsFragment extends StatefulWidget {
  String title;

  AnalyticsFragment({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _AnalyticsFragmentState();
}

class _AnalyticsFragmentState extends State<AnalyticsFragment> {

  Map<String, double> dataMap = {
    "Flutter": 50,
    "React": 30,
    "Xamarin": 20,
    "Ionic": 20,
    "Meta": 0.1,
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        child: InkWell(
          onTap: (){},
          child: PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3.2,

            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 32,
            centerText: "HYBRID",
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
            // gradientList: ---To add gradient colors---
            // emptyColorGradient: ---Empty Color gradient---
          ),
        ),
      ),
    );
  }



}

