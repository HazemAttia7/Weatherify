import 'package:flutter/material.dart';
import 'package:weather_app/bottom%20sheet/widgets/custom_card_widget.dart';
import 'package:weather_app/bottom%20sheet/widgets/uv_index_card_content.dart';

class UVIndexCard extends StatelessWidget {
  const UVIndexCard({super.key, required this.uvIndex});
  final double uvIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomCard(
        widget: UVIndexCardContent(uvIndex: uvIndex),
        width: MediaQuery.of(context).size.width / 2,
      ),
    );
  }
}
