import 'package:flutter/material.dart';

class BackgroundBottomLayer extends StatelessWidget {
  const BackgroundBottomLayer({super.key, required this.sheetProgress});
  final double sheetProgress;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.lerp(
              const BorderRadius.only(
                topLeft: Radius.circular(44),
                topRight: Radius.circular(44),
              ),
              BorderRadius.zero,
              sheetProgress,
            )!,
        gradient: const LinearGradient(
          // These begin/end values approximate the 167.57deg angle
          begin: Alignment(0.8, -0.9),
          end: Alignment(-0.8, 0.9),
          colors: [
            Color.fromARGB(86, 90, 54, 180),
            Color.fromARGB(98, 54, 42, 132),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(44),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(44),
            border: Border(
              top: BorderSide(
                color: Colors.white.withOpacity(0.5), // Tweak opacity as needed
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
