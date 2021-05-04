import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  Details(
      {this.humidity, this.windSpeed, this.image, this.minTemp, this.maxTemp});
  final String humidity;
  final String windSpeed;
  final String image;
  final String minTemp;
  final String maxTemp;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          title: Text(
            'Details',
            style: TextStyle(color: Colors.grey),
          )),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
            child: Image.network(
              widget.image,
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 20),
            child: Text(widget.minTemp + 'ºC' + "/" + widget.maxTemp + 'ºC',
              style: TextStyle(fontSize: 40, color: Colors.grey),),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Humidity:",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.humidity + "%",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Windspeed:",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.windSpeed + 'mph',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
