import 'dart:ui';
import 'package:flutter/material.dart';

class TopCliper extends CustomClipper<Path> {
  final double desiredWidth;

  TopCliper({this.desiredWidth = 266});

  @override
  Path getClip(Size size) {
    Path path = Path();

    double centerX = size.width / 2;
    double clipWidth = desiredWidth.clamp(100, size.width);
    double halfClipWidth = clipWidth / 2;

    final double xScaling = clipWidth / 266;
    final double yScaling = size.height / 100;

    double startX = centerX - halfClipWidth;

    path.moveTo(startX + (0 * xScaling), 0 * yScaling);

    // Left side
    path.lineTo(startX + (112 * xScaling), 0 * yScaling);
    path.cubicTo(
      startX + (112 * xScaling),
      0 * yScaling,
      startX + (154 * xScaling),
      0 * yScaling,
      startX + (154 * xScaling),
      0 * yScaling,
    );
    path.cubicTo(
      startX + (186 * xScaling),
      0 * yScaling,
      startX + (195.501 * xScaling),
      24.1398 * yScaling,
      startX + (205.732 * xScaling),
      48.6985 * yScaling,
    );
    path.cubicTo(
      startX + (216.325 * xScaling),
      74.1247 * yScaling,
      startX + (227 * xScaling),
      100 * yScaling,
      startX + (262 * xScaling),
      100 * yScaling,
    );

    // Right side
    path.lineTo(startX + (4.00006 * xScaling), 100 * yScaling);
    path.cubicTo(
      startX + (39.0001 * xScaling),
      100 * yScaling,
      startX + (49.6754 * xScaling),
      74.1247 * yScaling,
      startX + (60.2678 * xScaling),
      48.6985 * yScaling,
    );
    path.cubicTo(
      startX + (70.4989 * xScaling),
      24.1398 * yScaling,
      startX + (80.0001 * xScaling),
      0 * yScaling,
      startX + (112 * xScaling),
      0 * yScaling,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper is TopCliper && oldClipper.desiredWidth != desiredWidth;
  }
}

class TopClipBorderPainter extends CustomPainter {
  final double desiredWidth;

  TopClipBorderPainter({this.desiredWidth = 266});

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double clipWidth = desiredWidth.clamp(100, size.width);
    double halfClipWidth = clipWidth / 2;

    final double xScaling = clipWidth / 266;
    final double yScaling = size.height / 100;
    double startX = centerX - halfClipWidth;

    Path path = Path();

    path.moveTo(startX + (4.00006 * xScaling), 100 * yScaling);

    // Left upward curve
    path.cubicTo(
      startX + (39.0001 * xScaling),
      100 * yScaling,
      startX + (49.6754 * xScaling),
      74.1247 * yScaling,
      startX + (60.2678 * xScaling),
      48.6985 * yScaling,
    );
    path.cubicTo(
      startX + (70.4989 * xScaling),
      24.1398 * yScaling,
      startX + (80.0001 * xScaling),
      0 * yScaling,
      startX + (112 * xScaling),
      0 * yScaling,
    );

    // Top flat segment
    path.cubicTo(
      startX + (112 * xScaling),
      0 * yScaling,
      startX + (154 * xScaling),
      0 * yScaling,
      startX + (154 * xScaling),
      0 * yScaling,
    );

    // Right downward curve
    path.cubicTo(
      startX + (186 * xScaling),
      0 * yScaling,
      startX + (195.501 * xScaling),
      24.1398 * yScaling,
      startX + (205.732 * xScaling),
      48.6985 * yScaling,
    );
    path.cubicTo(
      startX + (216.325 * xScaling),
      74.1247 * yScaling,
      startX + (227 * xScaling),
      100 * yScaling,
      startX + (262 * xScaling),
      100 * yScaling,
    );

    // ✅ Close the shape
    path.close();

    final paint =
        Paint()
          ..color = const Color.fromRGBO(117, 130, 244, 0.5)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant TopClipBorderPainter oldDelegate) {
    return oldDelegate.desiredWidth != desiredWidth;
  }
}

class BottomCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 390;
    final double yScaling = size.height / 89;

    path.moveTo(0, 0);
    path.cubicTo(
      76.0769 * xScaling,
      16.9822 * yScaling,
      127 * xScaling,
      21 * yScaling,
      153.339 * xScaling,
      23.0782 * yScaling,
    );
    path.cubicTo(
      168.554 * xScaling,
      24 * yScaling,
      195 * xScaling,
      24 * yScaling,
      221.446 * xScaling,
      24 * yScaling,
    );
    path.cubicTo(
      235.661 * xScaling,
      23.0782 * yScaling,
      262 * xScaling,
      21 * yScaling,
      312.923 * xScaling,
      16.9822 * yScaling,
    );
    path.lineTo(390 * xScaling, 1 * yScaling);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BottomClipBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double xScaling = size.width / 390;
    final double yScaling = size.height / 89;

    Path path = Path();
    path.moveTo(0, 0);
    path.cubicTo(
      76.0769 * xScaling,
      16.9822 * yScaling,
      127 * xScaling,
      21 * yScaling,
      153.339 * xScaling,
      23.0782 * yScaling,
    );
    path.cubicTo(
      168.554 * xScaling,
      24 * yScaling,
      195 * xScaling,
      24 * yScaling,
      221.446 * xScaling,
      24 * yScaling,
    );
    path.cubicTo(
      235.661 * xScaling,
      23.0782 * yScaling,
      262 * xScaling,
      21 * yScaling,
      312.923 * xScaling,
      16.9822 * yScaling,
    );
    path.lineTo(390 * xScaling, 1 * yScaling);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    final paint =
        Paint()
          ..color = const Color.fromRGBO(117, 130, 244, 0.5)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Ellipse1 extends StatelessWidget {
  const Ellipse1({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 271,
      child: Container(
        width: 450,
        height: 450,
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            center: Alignment.center,
            colors: [
              Color(0xff362A84),
              Color.fromRGBO(97, 47, 171, 0),
              Color(0xff362A84),
              Color.fromRGBO(97, 47, 171, 0),
              Color(0xff362A84),
            ],
            stops: [0.0, 0.25, 0.45, 0.7, 1.0],
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: Colors.transparent),
        ),
      ),
    );
  }
}

class Ellipse2 extends StatelessWidget {
  const Ellipse2({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -100,
      left: 171,
      child: Container(
        width: 450,
        height: 450,
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            center: Alignment.center,
            colors: [
              Color(0xff362A84),
              Color.fromRGBO(97, 47, 171, 0),
              Color(0xff362A84),
              Color.fromRGBO(97, 47, 171, 0),
              Color(0xff362A84),
            ],
            stops: [0.0, 0.25, 0.45, 0.7, 1.0],
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Container(color: Colors.transparent),
        ),
      ),
    );
  }
}
