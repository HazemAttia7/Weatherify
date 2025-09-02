import 'package:flutter/material.dart';
import 'package:weather_app/bottom%20sheet/widgets/air_quality_card_content.dart';
import 'package:weather_app/bottom%20sheet/widgets/custom_card_widget.dart';

class AirQualityCard extends StatelessWidget {
  const AirQualityCard({super.key, required this.aqi});
  final int aqi;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget:  AirQualityCardContent(aqi: aqi),
      width: MediaQuery.of(context).size.width,
    );
  }
}
