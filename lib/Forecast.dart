import 'package:coding_challenge/Details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Api.dart';
import 'Model.dart';

class Forecast extends StatefulWidget {
  Forecast({this.codeCity, this.cityName});
  final String codeCity;
  final String cityName;

  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  _listCity() {
    Api api = Api();
    return api.getCity(widget.codeCity);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 10),
          alignment: Alignment.centerLeft,
          child: Text(widget.cityName,
              style: TextStyle(color: Colors.black54, fontSize: 30)),
        ),
        FutureBuilder<List<CityWeather>>(
          future: _listCity(),
          builder: (contex, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        List<CityWeather> cities = snapshot.data;
                        CityWeather city = cities[index];
                        return GestureDetector(
                          child: Card(
                            shadowColor: Colors.black,
                            elevation: 4,
                            margin: EdgeInsets.only(
                                left: 10, top: 5, bottom: 5, right: 10),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(8),
                              leading: Text(
                                  DateFormat('EEEE')
                                      .format(DateTime.parse(city.date)),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              title: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                    city.min_temp.toString() +
                                        'ºC' +
                                        '/' +
                                        city.max_temp.toString() +
                                        'ºC',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 20)),
                              ),
                              trailing: Image.network(
                                city.image,
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Details(
                                      humidity: city.humidity.toString(),
                                      windSpeed: city.wind_speed.toString(),
                                      image: city.image.toString(),
                                      minTemp: city.min_temp.toString(),
                                      maxTemp: city.max_temp.toString(),
                                    )));
                          },
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                            height: 0,
                            color: Colors.transparent,
                          ),
                      itemCount: snapshot.data.length);
                } else {
                  return Center(
                    child: Text("No data!"),
                  );
                }
                break;
            }
            return null;
          },
        ),
      ],
    );
  }
}
