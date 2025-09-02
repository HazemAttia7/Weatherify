import 'package:flutter/material.dart';
import 'package:weather_app/bottom%20sheet/widgets/custom_list_tile_widget.dart';
import 'package:weather_app/bottom%20sheet/widgets/sunrise_progrees_bar_widget.dart';

class SunriseCardContent extends StatelessWidget {
  const SunriseCardContent({
    super.key,
    required this.sunrise,
    required this.sunset,
  });
  final DateTime sunrise;
  final DateTime sunset;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomListTile(
          image: "assets/images/sunrise.png",
          leadingText: "SUNRISE",
        ),
        Text(
          getHourFromDateTime(sunrise.toString()),
          style: const TextStyle(height: 1, color: Colors.white, fontSize: 33),
        ),
        Padding(
          padding: const EdgeInsets.all(8.5),
          child: SizedBox(
            height: 65,
            child: SunriseProgressBar(
              progress: calculateSunProgress(sunrise, sunset),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Sunset: ${getHourFromDateTime(sunset.toString())}",
            style: const TextStyle(
              height: 1,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}

double calculateSunProgress(
  DateTime sunrise,
  DateTime sunset, [
  DateTime? currentTime,
]) {
  currentTime ??= DateTime.now();

  // Normalize all times to today's date
  final today = DateTime.now();
  final sunriseToday = DateTime(
    today.year,
    today.month,
    today.day,
    sunrise.hour,
    sunrise.minute,
  );
  final sunsetToday = DateTime(
    today.year,
    today.month,
    today.day,
    sunset.hour,
    sunset.minute,
  );

  // Calculate total daylight duration in milliseconds
  final daylightDuration = sunsetToday.difference(sunriseToday).inMilliseconds;

  // Calculate elapsed time since sunrise in milliseconds
  final elapsedSinceSunrise =
      currentTime.difference(sunriseToday).inMilliseconds;

  // Calculate and clamp progress between 0.0 and 1.0
  return (elapsedSinceSunrise / daylightDuration).clamp(0.0, 1.0);
}

String getHourFromDateTime(String date) {
  // Split by space to get the time part
  final timePart = date.split(' ')[1]; // Gets "06:30"
  final parts = timePart.split(':');
  int hour = int.parse(parts[0]);
  final minute = int.parse(parts[1]).toString().padLeft(2, '0');

  // Convert 24-hour to 12-hour format
  String amPm = 'AM';
  if (hour == 0) {
    hour = 12; // Midnight
  } else if (hour == 12) {
    amPm = 'PM'; // Noon
  } else if (hour > 12) {
    hour -= 12;
    amPm = 'PM';
  }

  final hourStr = hour.toString().padLeft(2, '0');
  return '$hourStr:$minute $amPm';
}
