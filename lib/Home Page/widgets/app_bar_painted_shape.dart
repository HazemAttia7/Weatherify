import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/global/helper/painters.dart';

class AppBarPaintedShape extends StatelessWidget {
  const AppBarPaintedShape({super.key, required this.sheetProgress});
  final double sheetProgress;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: lerpDouble(1, 0, sheetProgress)!,
      child: SizedBox(
        height: 90,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipPath(
              clipper: TopCliper(),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xFF262C51), Color(0xFF3E3F74)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF7582F4),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
            CustomPaint(painter: TopClipBorderPainter()),
            Center(
              child: Image.asset(
                "assets/images/weather app logo.png",
                width: 58,
              ),
            ),
          ], //width 58
        ),
      ),
    );
  }
}
