import 'package:flutter/material.dart';

class ForecastIconWithPercentage extends StatelessWidget {
  const ForecastIconWithPercentage({
    super.key,
    required this.conditionImage,
    required this.chanceOfRain,
  });
  final String conditionImage;
  final int chanceOfRain;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset("assets/images/$conditionImage", width: 32),
        Positioned(
          top: 25,
          child: Text(
            chanceOfRain == 0 ? "" : "$chanceOfRain%",
            style: const TextStyle(
              color: Color(0xff40CBD8),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
