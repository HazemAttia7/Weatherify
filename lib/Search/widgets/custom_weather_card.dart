import 'package:flutter/material.dart';
import 'package:weather_app/Home%20Page/models/current_weather_model.dart';
import 'package:weather_app/Search/helper/card_clipper.dart';
import 'package:weather_app/global/helper/helpers.dart';

class CustomWeatherCard extends StatelessWidget {
  const CustomWeatherCard({
    super.key,
    required this.currentWeatherModel,
    required this.onTap,
  });
  final CurrentWeatherModel currentWeatherModel;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: CardClipper(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 170,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft, // 90deg = left to right
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0355], // 0% and 103.55%
                  colors: [
                    Color(0xFF5936B4), // #5936B4
                    Color(0xFF362A84), // #362A84
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "${currentWeatherModel.temp}°",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "H:${currentWeatherModel.maxTemp}°   L:${currentWeatherModel.minTemp}°",
                      style: const TextStyle(
                        color: Color(0xffA1A1BA),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 180,
                          child: Text(
                            (currentWeatherModel.capital !=
                                    currentWeatherModel.cityName)
                                ? "${currentWeatherModel.capital}, ${currentWeatherModel.cityName}"
                                : currentWeatherModel.capital,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text(
                              textAlign: TextAlign.center,
                              currentWeatherModel.condition.contains("or")
                                  ? currentWeatherModel.condition.substring(
                                    0,
                                    currentWeatherModel.condition.indexOf(
                                          "or",
                                        ) -
                                        1,
                                  )
                                  : currentWeatherModel.condition.contains(
                                    "with",
                                  )
                                  ? currentWeatherModel.condition.substring(
                                    0,
                                    currentWeatherModel.condition.indexOf(
                                          "with",
                                        ) -
                                        1,
                                  )
                                  : currentWeatherModel.condition,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: 0,
            child: Image.asset(
              "assets/images/${getConditionImage(currentWeatherModel.condition, currentWeatherModel.isDay)}",
              width: 160,
            ),
          ),
        ],
      ),
    );
  }
}
