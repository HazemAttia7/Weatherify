import 'package:flutter/material.dart';
import 'package:weather_app/global/helper/helpers.dart';
import 'package:weather_app/bottom%20sheet/widgets/forecast_text_widget.dart';
import 'package:weather_app/bottom%20sheet/widgets/animated_underline_widget.dart';

class ForecastHeader extends StatefulWidget {
  const ForecastHeader({super.key, required this.pageController});
  final PageController pageController;
  @override
  State<ForecastHeader> createState() => _ForecastHeaderState();
}

class _ForecastHeaderState extends State<ForecastHeader> {
  enForecastType forecastType = enForecastType.hourly;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedUnderline(forecastType: forecastType),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ForecastText(
              text: "Hourly Forecast",
              onTap: () {
                widget.pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
                forecastType = enForecastType.hourly;
                setState(() {});
              },
            ),
            ForecastText(
              text: "Weekly Forecast",
              onTap: () {
                widget.pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
                forecastType = enForecastType.weekly;
                setState(() {});
              },
            ),
          ],
        ),
      ],
    );
  }
}
