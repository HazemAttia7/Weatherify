import 'package:intl/intl.dart';

class WeatherDetailsModel {
  final int airQuality;
  final double uvIndex;
  final DateTime sunrise;
  final DateTime sunset;

  WeatherDetailsModel({
    required this.airQuality,
    required this.uvIndex,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherDetailsModel.fromJSON(json1, json2) {
    final format = DateFormat('hh:mm a');
    final today = DateTime.now();
    return WeatherDetailsModel(
      airQuality: json1["current"]["air_quality"]["us-epa-index"],
      uvIndex: json1["current"]["uv"],
      sunrise: format
          .parse(json2["astronomy"]["astro"]["sunrise"])
          .copyWith(year: today.year, month: today.month, day: today.day),
      sunset: format
          .parse(json2["astronomy"]["astro"]["sunset"])
          .copyWith(year: today.year, month: today.month, day: today.day),
    );
  }
}
