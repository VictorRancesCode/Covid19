import 'package:covid/widgets/cardStatistic.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Statistics extends StatefulWidget {
  Statistics({Key key}) : super(key: key);

  @override
  _Statistics createState() => _Statistics();
}

class _Statistics extends State<Statistics> {
  List<charts.Series<Departament, String>> _seriesPieData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = List<charts.Series<Departament, String>>();
    _generateData();
  }

  _generateData() {
    var pieData = [
      new Departament("Santa Cruz", 26, Colors.green),
      new Departament("Cochabamba", 10, Colors.blue),
      new Departament("Oruro", 8, Colors.amber),
      new Departament("La Paz", 9, Colors.brown),
      new Departament("Pando", 1, Colors.teal),
      new Departament("Tarija", 1, Colors.cyanAccent),
      new Departament("Chuquisaca", 1, Colors.orange),
      new Departament("Beni", 1, Colors.purple),
      new Departament("Potosi", 1, Colors.greenAccent),
    ];
    _seriesPieData.add(
      charts.Series(
          data: pieData,
          domainFn: (Departament dp, _) => dp.name,
          measureFn: (Departament dp, _) => dp.value,
          colorFn: (Departament dp, _) =>
              charts.ColorUtil.fromDartColor(dp.color),
          id: "Departaments",
          labelAccessorFn: (Departament dp, _) => '${dp.value} cases'),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Country Statistics",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CardStatistic(
                title: "Total",
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 500,
                child: charts.PieChart(
                  _seriesPieData,
                  animate: true,
                  animationDuration: Duration(seconds: 5),
                  behaviors: [
                    new charts.DatumLegend(
                      outsideJustification:
                      charts.OutsideJustification.endDrawArea,
                      horizontalFirst: false,
                      desiredMaxRows: 2,
                      cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                      entryTextStyle: charts.TextStyleSpec(
                          color: charts.MaterialPalette.purple.shadeDefault,
                          fontFamily: 'Georgia',
                          fontSize: 11),
                    )
                  ],
                  defaultRenderer: new charts.ArcRendererConfig(
                    arcWidth: 100,
                    arcRendererDecorators: [
                      new charts.ArcLabelDecorator(
                          labelPosition: charts.ArcLabelPosition.auto)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Departament {
  String name;
  double value;
  Color color;

  Departament(this.name, this.value, this.color);
}
