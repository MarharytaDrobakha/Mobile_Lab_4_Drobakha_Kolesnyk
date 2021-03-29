import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class FileRead extends StatefulWidget {
  @override
  _FileReadState createState() => _FileReadState();
}

class _FileReadState extends State<FileRead> {
  String text = "";

  Future<void> loadAsset() async {
    final assetData = await rootBundle.loadString('assets/files/contract.txt');
    setState(() {
      text = assetData;
    });
  }

  @override
  Widget build(BuildContext context) {

    loadAsset();

    return Scaffold(
        appBar: AppBar(
          title: Text("Документація"),
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Center(
                  child: Text(text != null ? text : '',),
                ),
              );
            }
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
