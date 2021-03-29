import 'package:flutter/material.dart';

class PowerUsageType extends StatelessWidget {
  Map routeData;

  @override
  Widget build(BuildContext context) {
    routeData = ModalRoute
        .of(context)
        .settings
        .arguments;
    String title = routeData['type'];
    String lowerTitle = title.toLowerCase();
    final List<String> items = <String> ['Договір', title, 'Моніторинг $lowerTitle', 'Покази лічильників', 'Нарахування', 'Перевірка споживанння', 'Інші дані'];


    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),

                  ),
                  onPressed: () {
                    if (items[index] == 'Моніторинг $lowerTitle') {
                      Navigator.pushNamed(context, '/chart', arguments: {"title": items[index]});
                    }
                  },
                  child: Text(
                      '${items[index]}',
                    style: TextStyle(color: Colors.black),
                  )
              ),
            );
          },
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