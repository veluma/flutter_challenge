class CityWeather {
  final String id;
  final String weather_state_name;
  final int humidity;
  final int min_temp;
  final int max_temp;
  final int wind_speed;
  final String image;
  final String date;

  CityWeather(
      {this.id,
      this.weather_state_name,
      this.humidity,
      this.min_temp,
      this.max_temp,
      this.wind_speed,
      this.image,
      this.date});

  factory CityWeather.fromJson(Map<String, dynamic> json) {
    return CityWeather(
        id: json["id"].toString(),
        weather_state_name: json["weather_state_name"],
        humidity: json["humidity"].toInt().round(),
        min_temp: json["min_temp"].toInt().round(),
        max_temp: json["max_temp"].toInt().round(),
        wind_speed: json["wind_speed"].toInt().round(),
        image: 'https://www.metaweather.com/static/img/weather/png/' + json["weather_state_abbr"].toString() + '.png',
        date: json['applicable_date'].toString(),
    );
  }

  @override
  String toString() {
    return 'Api{id: $id, title: $weather_state_name, humidity: $humidity, minTem: $min_temp, maxTemp: $max_temp, windSpeed: $wind_speed, image: $image, date: $date}';
  }
}
