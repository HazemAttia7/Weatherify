class CurrentWeatherModel {
   String cityName;
  String capital;
  final double temp;
  final String condition;
  final double maxTemp;
  final double minTemp;
  final bool isDay;

  CurrentWeatherModel({
    this.capital = "",
    required this.cityName,
    required this.temp,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
    required this.isDay,
  });

  factory CurrentWeatherModel.fromJSON(json, {String capital = ""}) {
    return CurrentWeatherModel(
      capital: capital,
      cityName: json["location"]["name"],
      temp: json["current"]["feelslike_c"],
      condition: json["current"]["condition"]["text"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"] as double,
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"] as double,
      isDay: json["current"]["is_day"] == 1,
    );
  }
}
