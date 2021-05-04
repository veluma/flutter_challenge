import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Api.dart';
import 'Model.dart';

class Forecast extends StatefulWidget {
  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  _listCity() {
    Api api = Api();
    return api.getCity("742676");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CityWeather>>(
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
                  itemBuilder: (context, index) {
                    List<CityWeather> cities = snapshot.data;
                    CityWeather city = cities[index];
                    return Card(
                      margin: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                      child: ListTile(
                        title: Text(DateFormat('EEEE').format(DateTime.parse(city.date))),
                        subtitle:Text(city.min_temp.toString() +'ºC'+ '/' + city.max_temp.toString() +'ºC'),
                        trailing: Image.network(city.image, width: 30, height: 30,),
                        isThreeLine: true,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  itemCount: snapshot.data.length);
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
            break;
        }
        return null;
      },
    );
  }
}
