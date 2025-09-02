import 'package:weather_app/global/helper/helpers.dart';

class HourlyForecastModel {
  final DateTime date;
  final String condition;
  final String conditionImage;
  final int chanceOfRain;
  final double temp;

  HourlyForecastModel({
    required this.date,
    required this.condition,
    required this.conditionImage,
    required this.chanceOfRain,
    required this.temp,
  });

  factory HourlyForecastModel.fromJSON(json, index) {
    String condition =
        json["forecast"]["forecastday"][0]["hour"][index]["condition"]["text"];
    return HourlyForecastModel(
      date: DateTime.parse(
        json["forecast"]["forecastday"][0]["hour"][index]["time"],
      ),
      condition: condition,
      conditionImage: getConditionImage(
        condition,
        (json["forecast"]["forecastday"][0]["hour"][index]["is_day"] == 1),
      ),
      chanceOfRain:
          json["forecast"]["forecastday"][0]["hour"][index]["chance_of_rain"],
      temp: json["forecast"]["forecastday"][0]["hour"][index]["feelslike_c"],
    );
  }
}

