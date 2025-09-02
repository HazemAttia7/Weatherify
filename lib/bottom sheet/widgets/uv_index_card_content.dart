import 'package:flutter/material.dart';
import 'package:weather_app/bottom%20sheet/widgets/custom_list_tile_widget.dart';
import 'package:weather_app/bottom%20sheet/widgets/progress_bar_widget.dart';

class UVIndexCardContent extends StatelessWidget {
  const UVIndexCardContent({super.key, required this.uvIndex});
  final double uvIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomListTile(
          image: "assets/images/sun.png",
          leadingText: "UV INDEX",
        ),
        const SizedBox(height: 20),
        Text(
          "$uvIndex",
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
            height: 1.0,
          ),
        ),
        Text(
          getUvCategory(uvIndex.round()),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 25),
        ProgressBar(progress: (uvIndex - 1) / 10),
      ],
    );
  }
}

String getUvCategory(int uvIndex) {
  if (uvIndex >= 1 && uvIndex <= 2) {
    return "Low";
  } else if (uvIndex >= 3 && uvIndex <= 5) {
    return "Moderate";
  } else if (uvIndex >= 6 && uvIndex <= 7) {
    return "High";
  } else if (uvIndex >= 8 && uvIndex <= 10) {
    return "Very high";
  } else if (uvIndex >= 11) {
    return "Extreme";
  } else {
    // Return a default for any other value, such as 0 or a negative number.
    return "N/A";
  }
}
