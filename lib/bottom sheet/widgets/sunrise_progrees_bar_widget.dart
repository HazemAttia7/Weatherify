import 'dart:math';
import 'package:flutter/material.dart';

class SunriseProgressBar extends StatelessWidget {
  const SunriseProgressBar({super.key, required this.progress});
  final double progress;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SunArcPainter(progress: progress),
      child: Container(),
    );
  }
}

class SunArcPainter extends CustomPainter {
  final double progress;

  SunArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final arcPaint =
        Paint()
          ..color = const Color(0xff978FA5)
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final backgroundPaint =
        Paint()
          ..color = Colors.white.withOpacity(0.1)
          ..strokeWidth = 12
          ..style = PaintingStyle.fill;

    // Create a perfect circle, but only draw the top half
    final diameter = size.width;
    final radius = diameter / 2;
    final centerX = size.width / 2;
    final centerY = size.height; // Position circle so only top half is visible

    final rect = Rect.fromCircle(
      center: Offset(centerX, centerY),
      radius: radius,
    );

    // Draw background semicircle (top half only)
    canvas.drawArc(
      rect,
      3.14159, // Start from left (π radians)
      3.14159, // Draw semicircle (π radians)
      false,
      backgroundPaint,
    );

    // Draw the main blue arc
    canvas.drawArc(
      rect,
      3.14159, // Start from left
      3.14159, // Full semicircle
      false,
      arcPaint,
    );

    // Calculate sun position on the arc
    final angle = 3.14159 + (3.14159 * progress); // π to 2π
    final sunX = centerX + radius * cos(angle);
    final sunY = centerY + radius * sin(angle);

    // Draw sun circle
    final sunPaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(sunX, sunY), 6, sunPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
