import 'package:coding_challenge/Home.dart';
import 'package:flutter/material.dart';

enum cityArray { lisbon, london, madrid }

class Settings extends StatefulWidget {
  Settings({this.codeCity, this.cityName});
  final String codeCity;
  final String cityName;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var _character;
  var _codeCity = "742676";

  @override
  Widget build(BuildContext context) {
    switch (widget.cityName) {
      case 'Lisbon':
        setState(() {
          _character = cityArray.lisbon;
        });
        break;
      case 'London':
        setState(() {
          _character = cityArray.london;
        });
        break;
      case 'Madrid':
        setState(() {
          _character = cityArray.madrid;
        });
        break;
      default:
        break;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.grey),
        )
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            child: ListTile(
              title: const Text('Lisbon', style: TextStyle(color: Colors.black54, fontSize: 20)),
              leading: Radio<cityArray>(
                value: cityArray.lisbon,
                groupValue: _character,
                onChanged: (value) {
                  setState(() {
                    _character = value;
                    _codeCity = "742676";
                  });
                },
              ),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) =>
                      Home(codeCity: _codeCity, cityName: 'Lisbon')),
                  ModalRoute.withName('/')
              );
            },
          ),
          GestureDetector(
            child: ListTile(
              title: const Text('London', style: TextStyle(color: Colors.black54, fontSize: 20)),
              leading: Radio<cityArray>(
                value: cityArray.london,
                groupValue: _character,
                onChanged: (value) {
                  setState(() {
                    _character = value;
                    _codeCity = "44418";
                  });
                },
              ),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) =>
                      Home(codeCity: _codeCity, cityName: 'London')),
                ModalRoute.withName('/')
              );
            },
          ),
          GestureDetector(
            child: ListTile(
              title: const Text('Madrid', style: TextStyle(color: Colors.black54, fontSize: 20)),
              leading: Radio<cityArray>(
                value: cityArray.madrid,
                groupValue: _character,
                onChanged: (value) {
                  setState(() {
                    _character = value;
                    _codeCity = "766273";
                  });
                },
              ),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) =>
                      Home(codeCity: _codeCity, cityName: 'Madrid')),
                  ModalRoute.withName('/')
              );
            },
          ),
        ],
      ),
    );
  }
}
