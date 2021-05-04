import 'package:coding_challenge/Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const lisbon = [
  {
    "title": "Lisbon",
    "location_type": "City",
    "woeid": 742676,
    "latt_long": "38.725670,-9.150370"
  }
];
const london = [
  {
    "title": "London",
    "location_type": "City",
    "woeid": 44418,
    "latt_long": "51.506321,-0.12714"
  }
];
const madrid = [
  {
    "title": "Madrid",
    "location_type": "City",
    "woeid": 766273,
    "latt_long": "40.420300,-3.705770"
  }
];

const URL_BASE = "https://www.metaweather.com/api/location/";

class Api {
  Future<List<CityWeather>> getCity(code) async {
    List<CityWeather> cities;
    http.Response response = await http
        .get(Uri.parse(URL_BASE + code));
    if (response.statusCode == 200) {
      Map<String, dynamic> dataJson = json.decode(response.body);
      cities = dataJson["consolidated_weather"].map<CityWeather>((map) {
        print(map);
        return CityWeather.fromJson(map);
      }).toList();
      return cities;
    } else {
      return cities;
    }
  }
}
