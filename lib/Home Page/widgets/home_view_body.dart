import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/Home%20Page/models/current_weather_model.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required double sheetProgress,
    required this.currentWeatherModel,
    required this.screenHeight,
    required double imageOpacity,
  }) : _sheetProgress = sheetProgress;

  final double _sheetProgress;
  final CurrentWeatherModel currentWeatherModel;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const SizedBox(height: 70),
          Transform.translate(
            offset:
                Offset.lerp(
                  Offset.zero, // The starting position (same as Offset(0, 0))
                  const Offset(0, -30), // The final position
                  _sheetProgress, // The progress from 0.0 to 1.0
                )!,
            child: Text(
              currentWeatherModel.cityName,
              style: const TextStyle(color: Colors.white, fontSize: 34),
            ),
          ),
          Transform.translate(
            offset:
                Offset.lerp(
                  const Offset(0, 0),
                  const Offset(-0, -95), // End position: 80px right, 120px up
                  _sheetProgress,
                )!,
            child: Text(
              "${currentWeatherModel.temp.round()}°",
              style: TextStyle(
                color:
                    Color.lerp(Colors.white, Colors.white60, _sheetProgress)!,
                fontSize: lerpDouble(96, 20, _sheetProgress)!,
                fontWeight:
                    FontWeight.lerp(
                      FontWeight.w200,
                      FontWeight.w600,
                      _sheetProgress,
                    )!,
                height: 1,
              ),
            ),
          ),
          Stack(
            children: [
              Transform.translate(
                offset:
                    Offset.lerp(
                      const Offset(0, 0),
                      const Offset(
                        0,
                        -60,
                      ), // End position: 80px right, 120px up
                      _sheetProgress,
                    )!,
                child: Text(
                  currentWeatherModel.condition,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: lerpDouble(25, 20, _sheetProgress)!,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Opacity(
            opacity: lerpDouble(1, 0, _sheetProgress)!,
            child: Text(
              "H:${currentWeatherModel.maxTemp.round()}°   L:${currentWeatherModel.minTemp.round()}°",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
