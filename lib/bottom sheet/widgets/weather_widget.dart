import 'package:flutter/material.dart';
import 'package:weather_app/bottom%20sheet/widgets/forecast_icon_with_percentage.dart';

class WeatherDettailsWidget extends StatelessWidget {
  const WeatherDettailsWidget({
    super.key,
    required this.date,
    required this.conditionImage,
    required this.chanceOfRain,
    required this.temp,
    required this.isNow,
  });
  final String date;
  final String conditionImage;
  final int chanceOfRain;
  final double temp;
  final bool isNow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 62,
        decoration: BoxDecoration(
          color:
              (isNow)
                  ? const Color.fromARGB(255, 84, 57, 180)
                  : const Color(0xff48319D).withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(4, 4),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            Text(
              isNow ? "Now" : date,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            ForecastIconWithPercentage(
              conditionImage: conditionImage,
              chanceOfRain: chanceOfRain,
            ),
            const SizedBox(),
            Text(
              "${temp.round()}°",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
