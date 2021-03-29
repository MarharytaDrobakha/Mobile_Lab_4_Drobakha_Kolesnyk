import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';


class ChartsDemo extends StatefulWidget {
  ChartsDemo() : super();

  @override
  ChartsDemoState createState() => ChartsDemoState();
}

class ChartsDemoState extends State<ChartsDemo> {
  //
  List<charts.Series> seriesList;
  Map routeData;
  String title;
  String _selectedDate;
  String dropdownValue1 = '1';
  String dropdownValue2 = '1';

  static List<charts.Series<Data, String>> _createRandomData() {
    final random = Random();

    final dataList = [
      Data('01.01', random.nextInt(100)),
      Data('01.02', random.nextInt(100)),
      Data('01.03', random.nextInt(100)),
      Data('01.04', random.nextInt(100)),
      Data('01.04', random.nextInt(100)),
    ];

    return [
      charts.Series<Data, String>(
        id: 'Chart',
        domainFn: (Data sales, _) => sales.date,
        measureFn: (Data sales, _) => sales.value,
        data: dataList,
        fillColorFn: (Data sales, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
      ),
    ];
  }

  barChart() {
    return Container(
      child: charts.BarChart(
        seriesList,
        animate: true,
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2022),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }

  chooseData() {
    return Container (
        child: Column(
          children: [
            Row(
              children: [
                Text("Корпус"),
                SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                  value: dropdownValue1,
                  items: <String>['1', '2', '3', '4'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue1 = newValue;
                    });
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                Text("ауд."),
                SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                  value: dropdownValue2,
                  items: <String>['1', '2', '3', '4'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue2 = newValue;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        child: Text(
                            "З якої дати",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF000000))
                        ),
                        onTap: (){
                          _selectDate(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        tooltip: 'Tap to open date picker',
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        child: Text(
                            "До якої дати",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF000000))
                        ),
                        onTap: (){
                          _selectDate(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        tooltip: 'Tap to open date picker',
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ],
                  ),
                ),
          ],
        ),
            Container(
              child: ElevatedButton(
                  onPressed: () {  },
                  child: Text("Змінити")
              ),
            )
          ]
        )
    );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    routeData = ModalRoute
        .of(context)
        .settings
        .arguments;
    title = routeData['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            chooseData(),
            SizedBox(
              width: 100,
              height: 400,
              child: barChart(),
            ),
          ]
      ),
    );
  }
}


class Data {
  final String date;
  final int value;

  Data(this.date, this.value);
}