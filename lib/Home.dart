import 'package:coding_challenge/Forecast.dart';
import 'package:coding_challenge/Settings.dart';
import 'package:coding_challenge/Details.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Settings(),
      Details()
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          title: Text(
            "Weather App",
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  print("configuracao");
                })
          ],
        ),
        body: Forecast()
    );
  }
}
