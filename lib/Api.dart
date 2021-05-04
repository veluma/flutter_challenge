import 'package:coding_challenge/Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
const URL_BASE = "https://www.metaweather.com/api/location/";

class Api {
  Future<List<CityWeather>> getCity(code) async {
    List<CityWeather> cities;
    http.Response response = await http
        .get(Uri.parse(URL_BASE + code));
    if (response.statusCode == 200) {
      Map<String, dynamic> dataJson = json.decode(response.body);
      cities = dataJson["consolidated_weather"].map<CityWeather>((map) {
        return CityWeather.fromJson(map);
      }).toList();
      return cities;
    } else {
      return cities;
    }
  }
}
