import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LastFiveSalesChart extends StatefulWidget {
  @override
  _LastFiveSalesChartState createState() => _LastFiveSalesChartState();
}

class _LastFiveSalesChartState extends State<LastFiveSalesChart> {
  List<charts.Series> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData(){
    final salesData = [
      Sales("1st", 200),
      Sales("2nd", 400),
      Sales("3rd", 800),
      Sales("4th", 90),
      Sales("5th", 1200),
    ];
    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: salesData,
      )
    ];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: true,
        vertical: true,
    );
  }
}

class Sales{
  final String year;
  final int sales;

  Sales(this.year, this.sales);
}