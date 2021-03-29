import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class ChartsDemo extends StatefulWidget {
  ChartsDemo() : super();

  @override
  ChartsDemoState createState() => ChartsDemoState();
}

class ChartsDemoState extends State<ChartsDemo> {
  //
  List<charts.Series<dynamic, String>> seriesList = [];
  Map routeData;
  String title;
  String selectedDateFrom = "З якої дати";
  String selectedDateTo = "До якої дати";
  String dropdownValue1 = '1';
  String dropdownValue2 = '1';



  String getAllTemps = "http://92.249.115.37:80/api/temp/read";
  //String getTempsWithDate = "92.249.115.37:80/api/temp/readWithDate?startDate=$selectedDateFrom&endDate=$selectedDateTo";
  //Map routeData = {};
  List <Data> dataChart = [];


  Future<void> getData() async {

    final response = await http.get(getAllTemps);

    var json = jsonDecode(response.body);
    List dataList = json['data'];

    for (var k in dataList) {
      dataChart.add(Data(DateFormat("dd-MM HH:mm").format(DateFormat("yyyy-MM-ddTHH:mm:ss").parse(k['timestamp'])), k['value']));
    }

    setState(() {
      seriesList = _createRandomData();
    });
  }

  Future<void> getDataWithDate() async {
    dataChart = [];

    String url(String selectedDateFrom, String selectedDateTo) =>
        "http://92.249.115.37:80/api/temp/readWithDate?startDate=$selectedDateFrom&endDate=$selectedDateTo";
    
    final response = await http.get(url(selectedDateFrom.toString(), selectedDateTo.toString()));

    var json = jsonDecode(response.body);
    List dataList = json['data'];

    for (var k in dataList) {
      dataChart.add(Data(DateFormat("dd-MM HH:mm").format(DateFormat("yyyy-MM-ddTHH:mm:ss").parse(k['timestamp'])), k['value']));
    }

    setState(() {
      seriesList = _createRandomData();
      debugPrint(dataChart.toString());
    });
  }

  List<charts.Series<Data, String>> _createRandomData() {
    return [
      charts.Series<Data, String>(
        id: 'Chart',
        domainFn: (Data sales, _) => sales.date,
        measureFn: (Data sales, _) => sales.value,
        data: dataChart,
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
        domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelRotation: 45
          )
        ),
      ),
    );
  }

  Future<void> _selectDateFrom(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2022),
    );
    if (d != null)
      setState(() {
        selectedDateFrom = new DateFormat("yyyy-MM-ddTHH:mm:ss").format(d);
      });
  }

  Future<void> _selectDateTo(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2022),
    );
    if (d != null)
      setState(() {
        selectedDateTo = new DateFormat("yyyy-MM-ddTHH:mm:ss").format(d);
      });
  }

  String getSelectedDate(String date) {
    if (date == "З якої дати" || date == "До якої дати") {
      return date;
    } else {
      return (DateFormat("dd-MM").format(DateFormat("yyyy-MM-ddTHH:mm:ss").parse(date)));
    }
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
                            getSelectedDate(selectedDateFrom),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF000000))
                        ),
                        onTap: (){
                          _selectDateFrom(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        tooltip: 'Tap to open date picker',
                        onPressed: () {
                          _selectDateFrom(context);
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        child: Text(
                            getSelectedDate(selectedDateTo),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF000000))
                        ),
                        onTap: (){
                          _selectDateTo(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        tooltip: 'Tap to open date picker',
                        onPressed: () {
                          _selectDateTo(context);
                        },
                      ),
                    ],
                  ),
                ),
          ],
        ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                      getDataWithDate();
                  },
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
    getData();
    //seriesList = _createRandomData();
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

  @override
  String toString() {
    return 'Data{date: $date, value: $value}';
  }
}