import 'package:flutter/material.dart';
import 'package:weather_app/bottom%20sheet/widgets/custom_list_tile_widget.dart';
import 'package:weather_app/bottom%20sheet/widgets/progress_bar_widget.dart';

class AirQualityCardContent extends StatelessWidget {
  const AirQualityCardContent({super.key, required this.aqi});
  final int aqi;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomListTile(
          image: "assets/images/wind.png",
          leadingText: 'AIR QUALITY',
        ),
        const SizedBox(height: 10),
        Text(
          "$aqi - ${getAqiCategory(aqi)}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 10),
        ProgressBar(progress: (aqi - 1) / 5),
        const SizedBox(height: 10),
      ],
    );
  }
}

String getAqiCategory(int usEpaIndex) {
  switch (usEpaIndex) {
    case 1:
      return "Good";
    case 2:
      return "Moderate";
    case 3:
      return "Unhealthy for Sensitive Groups";
    case 4:
      return "Unhealthy";
    case 5:
      return "Very unhealthy";
    case 6:
      return "Hazardous";
    default:
      return "N/A"; // Return "N/A" for an unknown index.
  }
}
