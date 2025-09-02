import 'package:flutter/material.dart';

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    const double radius = 25.0; // Corner radius

    // Start from top-left corner (after radius)
    path.moveTo(radius, 0);

    // Top edge with wavy curve
    path.cubicTo(
      size.width * 0.25,
      5,
      size.width * 0.75,
      25,
      size.width - radius,
      35,
    );

    // Top-right rounded corner
    path.arcToPoint(
      Offset(size.width, radius + 35),
      radius: const Radius.circular(radius),
    );

    // Right edge
    path.lineTo(size.width, size.height - radius);

    // Bottom-right rounded corner
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: const Radius.circular(radius),
    );

    // Bottom edge
    path.lineTo(radius, size.height);

    // Bottom-left rounded corner
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: const Radius.circular(radius),
    );

    // Left edge
    path.lineTo(0, radius);

    // Top-left rounded corner
    path.arcToPoint(const Offset(radius, 0), radius: const Radius.circular(radius));

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
