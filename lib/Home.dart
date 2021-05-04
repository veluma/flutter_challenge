import 'package:coding_challenge/Forecast.dart';
import 'package:coding_challenge/Settings.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({this.codeCity, this.cityName});
  final String codeCity;
  final String cityName;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Settings(codeCity: widget.codeCity, cityName: widget.cityName,)));
                })
          ],
        ),
        body: Forecast(codeCity: widget.codeCity, cityName: widget.cityName,)
        );
  }
}
