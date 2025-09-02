import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          // The angle 168.44deg is converted to begin/end alignments
          begin: Alignment(-0.20, -0.98),
          end: Alignment(0.20, 0.98),
          // Color stops are converted from percentages to fractional values
          stops: [0.0162, 0.9572],
          colors: [Color.fromARGB(255, 61, 46, 90), Color(0xFF1C1B33)],
        ),
      ),
    );
  }
}
