import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contract extends StatelessWidget {
  final List<String> contracts = <String> ['Договори на теплопостачання', 'Договори на електропостачання', 'Договори на водопостачання', 'Договори на газопостачання', ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Договори енергопостачання"),
      ),
      body: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: contracts.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: ElevatedButton(
                        style: ButtonStyle(
                          alignment: Alignment.centerLeft,
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white70),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fileRead');
                        },
                        child: Text(
                          '${contracts[index]}',
                          style: TextStyle(color: Colors.black),
                        )
                    )
                );
              }
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text("Завантажити документ")
          ),
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Colors.deepPurple,
            items: const <BottomNavigationBarItem> [
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
              if (index == 0) {
              }
              if (index == 1) {
                Navigator.pop(context);
              } else {
              }
            }
        )
    );
  }
}
