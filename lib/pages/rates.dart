import 'package:flutter/material.dart';

class Rates extends StatelessWidget {
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
                  DataCell(Text('15 грн')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Водопостачання')),
                  DataCell(Text('28 грн')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Теплопостачання')),
                  DataCell(Text('23 грн')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Газопостачання')),
                  DataCell(Text('25 грн')),
                ]),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 10,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Змінити тарифи")),
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
