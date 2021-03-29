import 'package:flutter/material.dart';
import 'package:lab_3_ui/pages/powerUsage.dart';

class Home extends StatelessWidget {
  final List<String> items = <String> ['Загальна інформація', 'Документація', 'Енергоспоживання', 'Договори енергопостачання', 'Тарифи на енергоносії'];

  @override
  Widget build(BuildContext context) {
    final title = 'Головна';

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
                    if (items[index] == 'Енергоспоживання') {
                      Navigator.pushNamed(context, '/powerUsage');
                    }
                    if (items[index] == 'Документація') {
                      Navigator.pushNamed(context, '/documentations');
                    }
                    if (items[index] == 'Договори енергопостачання') {
                      Navigator.pushNamed(context, '/contracts');
                    }
                    if (items[index] == 'Тарифи на енергоносії') {
                      Navigator.pushNamed(context, '/rates');
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