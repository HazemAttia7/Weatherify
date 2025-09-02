import 'package:flutter/material.dart';
import 'package:weather_app/global/helper/painters.dart';
import 'package:weather_app/bottom%20sheet/widgets/bottom_sheet_content.dart';

class GlassBackgroundAndContent extends StatelessWidget {
  const GlassBackgroundAndContent({
    super.key,
    required this.scrollController,
    required this.sheetProgress,
  });
  final ScrollController scrollController;
  final double sheetProgress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: ClipRRect(
        borderRadius:
            BorderRadius.lerp(
              const BorderRadius.only(
                topLeft: Radius.circular(44),
                topRight: Radius.circular(44),
              ),
              BorderRadius.zero,
              sheetProgress,
            )!,
        child: Stack(
          children: [
            const Ellipse1(),
            const Ellipse2(),
            BottomSheetContent(
              scrollController: scrollController,
              sheetProgress: sheetProgress,
            ),
          ],
        ),
      ),
    );
  }
}
