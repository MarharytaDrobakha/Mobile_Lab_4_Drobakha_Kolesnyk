import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Rates extends StatefulWidget {

  @override
  _RatesState createState() => _RatesState();
}

class _RatesState extends State<Rates> {
  String jsonString = "http://92.249.115.37:80/api/rates/read";

  List dataRate = [];

  Rate rate = Rate(1, 1, 1, 1);

  Future<void> getData() async {
    final response = await http.get(jsonString);

    var json = jsonDecode(response.body);
    setState(() {
      rate = Rate.fromJson(json['rates']);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Тарифи на енергопостачання"),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            DataTable(
              columns: [
                DataColumn(
                    label: Text('',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Тариф',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Електропостачання')),
                  DataCell(Text(rate.electricityRate.toString()+" грн")),
                ]),
                DataRow(cells: [
                  DataCell(Text('Водопостачання')),
                  DataCell(Text(rate.waterRate.toString()+" грн")),
                ]),
                DataRow(cells: [
                  DataCell(Text('Теплопостачання')),
                  DataCell(Text(rate.heatRate.toString()+" грн")),
                ]),
                DataRow(cells: [
                  DataCell(Text('Газопостачання')),
                  DataCell(Text(rate.gasRate.toString()+" грн")),
                ]),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 10,
              child: ElevatedButton(
                  onPressed: () {
                    getData();
                  },
                  child: Text("Оновити тарифи")),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            //backgroundColor: Colors.deepPurple,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back),
                label: "Back",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_forward),
                label: "Forward",
              )
            ],
            onTap: (int index) {
              if (index == 0) {}
              if (index == 1) {
                Navigator.pop(context);
              } else {}
            }));
  }
}


class Rate {
  int electricityRate;
  int waterRate;
  int heatRate;
  int gasRate;

  Rate(this.electricityRate, this.waterRate, this.heatRate, this.gasRate);

  Rate.fromJson(Map<String, dynamic> json)
      : electricityRate = json['electricityRate'],
        waterRate = json['waterRate'],
        heatRate = json['heatRate'],
        gasRate = json['gasRate'];

  @override
  String toString() {
    return 'Rate{electricityRate: $electricityRate, waterRate: $waterRate, heatRate: $heatRate, gasRate: $gasRate}';
  }
}