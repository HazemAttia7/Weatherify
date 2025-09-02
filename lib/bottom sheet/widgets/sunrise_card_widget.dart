
import 'package:flutter/material.dart';
import 'package:weather_app/bottom%20sheet/widgets/custom_card_widget.dart';
import 'package:weather_app/bottom%20sheet/widgets/sunrise_card_content.dart';

class SunriseCard extends StatelessWidget {
  const SunriseCard({super.key, required this.sunrise, required this.sunset});
  final DateTime sunrise;
  final DateTime sunset;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomCard(
        widget:  SunriseCardContent(sunrise: sunrise, sunset: sunset,),
        width: MediaQuery.of(context).size.width / 2,
      ),
    );
  }
}
