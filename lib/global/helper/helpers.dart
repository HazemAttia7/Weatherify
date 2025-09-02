import 'package:flutter/material.dart';
import 'package:weather_app/global/widgets/custom_alert_dialog.dart';

// ignore: camel_case_types
enum enForecastType { hourly, weekly }

const String apiKey = "d9d13b2b267445429d0145019251103";

const String baseUrl = "https://api.weatherapi.com/v1";

String? defaultCountry;

String getConditionImage(String condition, bool isDay) {
  final lowerCaseCondition = condition.toLowerCase();

  // Highest priority: Tornado
  if (lowerCaseCondition.contains("tornado")) {
    return "Tornado.png";
  }

  // Handle rain conditions
  if (lowerCaseCondition.contains("rain") ||
      lowerCaseCondition.contains("drizzle") ||
      lowerCaseCondition.contains("sleet") ||
      lowerCaseCondition.contains("snow") ||
      lowerCaseCondition.contains("cloud") ||
      lowerCaseCondition.contains("overcast")) {
    // Added other precipitation types
    if (isDay) {
      // Prioritize "Sun cloud mid rain.png" if that's your general day rain.
      // If you prefer "Sun cloud angled rain.png" for all day rain, use that.
      return "Sun cloud mid rain.png";
    } else {
      return "Moon cloud mid rain.png";
    }
  }

  // Handle wind conditions (only have a night wind icon)
  if (lowerCaseCondition.contains("wind") ||
      lowerCaseCondition.contains("blizzard")) {
    if (!isDay) {
      return "Moon cloud fast wind.png";
    }
  }

  // General daytime conditions (clear, sunny, partly cloudy, cloudy, overcast, mist, fog)
  if (isDay || lowerCaseCondition.contains("sunny")) {
    return "Sunny.png";
  } else {
    return "moon.png";
  }
}

Future<dynamic> showFindMyCityUsingGPSAlertDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const CustomAlertDialog(),
  );
}
