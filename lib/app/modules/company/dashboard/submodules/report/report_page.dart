import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Relatórios'),
          circularChart(null),
          circularChart2(null),
        ],
      ),
    );
  }

  Widget circularChart(data) {
    final List<charts.Series> seriesList = [
      charts.Series<dynamic, int>(
        id: 'training',
        domainFn: (dynamic sales, _) => sales['index'],
        measureFn: (dynamic sales, _) => sales['value'],
        colorFn: (data, color) {
          return data['index'] % 2 == 0
              ? charts.MaterialPalette.green.shadeDefault
              : charts.ColorUtil.fromDartColor(Color(0xFFFC616F));
        },
        data: true
            ? [
                {'index': 1, 'value': 30},
                {'index': 2, 'value': 40},
                {'index': 3, 'value': 30},
              ]
            : List.from(data['series']).sublist(1, 3).asMap().entries.map((e) {
                return {'index': e.key, 'value': e.value};
              }).toList(),
      )
    ];

    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: 300,
      child: Flexible(
        child: Stack(
          alignment: Alignment.center,
          children: [
            charts.PieChart(
              seriesList,
              defaultRenderer: charts.ArcRendererConfig(arcWidth: 60),
            ),
          ],
        ),
      ),
    );
  }

  Widget circularChart2(data) {
    final List<charts.Series> seriesList = [
      charts.Series<dynamic, int>(
        id: 'training',
        domainFn: (dynamic item, _) => item['index'],
        measureFn: (dynamic item, _) => item['value'],
        labelAccessorFn: (dynamic item, _) =>
            '${item['index']}: ${item['value']}',
        colorFn: (data, color) {
          return data['index'] % 2 == 0
              ? charts.MaterialPalette.green.shadeDefault
              : charts.ColorUtil.fromDartColor(Color(0xFFFC616F));
        },
        data: true
            ? [
                {'index': 1, 'value': 50},
                {'index': 2, 'value': 20},
                {'index': 3, 'value': 25},
                {'index': 4, 'value': 5},
              ]
            : List.from(data['series']).sublist(1, 3).asMap().entries.map((e) {
                return {'index': e.key, 'value': e.value};
              }).toList(),
      )
    ];

    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: 300,
      child: Flexible(
        child: Stack(
          alignment: Alignment.center,
          children: [
            charts.PieChart(
              seriesList,
              //defaultRenderer: charts.ArcRendererConfig(arcWidth: 60),
              defaultRenderer: new charts.ArcRendererConfig(
                arcRendererDecorators: [
                  new charts.ArcLabelDecorator(
                      labelPosition: charts.ArcLabelPosition.outside)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
