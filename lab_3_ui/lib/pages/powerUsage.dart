import 'package:flutter/material.dart';

class PowerUsage extends StatelessWidget {
  final List<String> items = <String> ['Теплопостачання', 'Енергопостачання', 'Електропостачання', 'Водопостачання', 'Газопостачання', 'Температурний моніторинг'];

  @override
  Widget build(BuildContext context) {
    final title = 'Енергоспоживання';

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
                    if (items[index] == 'Температурний моніторинг') {
                      Navigator.pushNamed(context, '/chart',
                          arguments: {"title": items[index]});
                    } else {
                      Navigator.pushNamed(
                          context, '/powerUsageType', arguments: {
                        'type': items[index],
                      }
                      );
                    }
                  },
                  child: Text(
                    '${items[index]}',
                    style: TextStyle(color: Colors.black),
                )
              )
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