import 'package:flutter/material.dart';
import 'package:weather_app/bottom%20sheet/widgets/background_bottom_layer.dart';
import 'package:weather_app/bottom%20sheet/widgets/glass_background_and_content_widget.dart';

class CustomDraggableScrollableSheet extends StatelessWidget {
  const CustomDraggableScrollableSheet({
    super.key,
    required this.sheetProgress,
  });
  final double sheetProgress;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.42,
      minChildSize: 0.42,
      maxChildSize: 0.85,
      snap: true,
      snapSizes: const [
        0.42, // The initial snap point
        0.85, // The full-screen snap point
      ],
      builder: (BuildContext context, ScrollController scrollController) {
        return Stack(
          children: [
            BackgroundBottomLayer(sheetProgress: sheetProgress),
            GlassBackgroundAndContent(
              scrollController: scrollController,
              sheetProgress: sheetProgress,
            ),
          ],
        );
      },
    );
  }
}
