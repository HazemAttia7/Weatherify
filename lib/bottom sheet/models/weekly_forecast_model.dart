import 'package:weather_app/global/helper/helpers.dart';

class WeeklyForecastModel {
  final DateTime date;
  final String condition;
  final String conditionImage;
  final int chanceOfRain;
  final double temp;

  WeeklyForecastModel({
    required this.date,
    required this.condition,
    required this.conditionImage,
    required this.chanceOfRain,
    required this.temp,
  });

  factory WeeklyForecastModel.fromJSON(json, index) {
    String condition =
        json["forecast"]["forecastday"][index]["day"]["condition"]["text"];
    return WeeklyForecastModel(
      date: DateTime.parse(json["forecast"]["forecastday"][index]["date"]),
      condition: condition,
      conditionImage: getConditionImage(condition, true),
      chanceOfRain:
          json["forecast"]["forecastday"][index]["day"]["daily_chance_of_rain"],
      temp: json["forecast"]["forecastday"][index]["day"]["avgtemp_c"],
    );
  }
}
