import 'package:flutter/material.dart';
import 'package:weather_app/global/helper/helpers.dart';

class AnimatedUnderline extends StatelessWidget {
  const AnimatedUnderline({super.key, required this.forecastType});

  final enForecastType forecastType;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left:
          (forecastType == enForecastType.hourly)
              ? 32
              : 230, // hourly : 42 , weekly : 258
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      child: Transform.translate(
        offset: const Offset(-10, 30),
        child: Container(
          width: 150,
          height: 5, // This is the thickness of the line
          decoration: BoxDecoration(
            // The LinearGradient creates the fade effect
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(
                  255,
                  187,
                  123,
                  233,
                ).withOpacity(0), // Start transparent on the left
                const Color.fromARGB(
                  255,
                  187,
                  123,
                  233,
                ), // Fade to solid in the middle
                const Color.fromARGB(
                  255,
                  123,
                  42,
                  229,
                ), // Stay solid in the middle
                const Color.fromARGB(255, 123, 42, 229).withOpacity(0),

                /// Fade to transparent on the right
              ],
              // The stops control where the color transitions happen.
              // 0.0 to 0.1: Fades in
              // 0.1 to 0.9: Solid color
              // 0.9 to 1.0: Fades out
              stops: const [0.0, 0.1, 0.9, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}
