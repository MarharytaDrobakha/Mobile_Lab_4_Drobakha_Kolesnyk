import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Documentation extends StatelessWidget {
  final List<String> documentations = <String> ['Енергетична політика', 'Програма з підвищення енергоефективності', 'Положення про СЕМ', 'Посадова інструкція'];

  Future<String> loadAsset(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('assets/assets.files/contract.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Документація"),
        ),
        body: Column(
          children: [
            Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: documentations.length,
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
                            '${documentations[index]}',
                            style: TextStyle(color: Colors.black),
                          )
                        )
                      );
                  }
              )
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text("Завантажити документ")
            )
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
