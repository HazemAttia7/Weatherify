import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required double sheetProgress,
    required this.screenHeight,
    required double imageOpacity,
    required this.image,
  }) : _sheetProgress = sheetProgress,
       _imageOpacity = imageOpacity;

  final double _sheetProgress;
  final double screenHeight;
  final double _imageOpacity;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      // Move the background up by 40% of the screen height
      offset:
          Offset.lerp(
            const Offset(0, 0),
            const Offset(0, -120), // End position: 80px right, 120px up
            _sheetProgress,
          )!,
      child: Opacity(
        opacity: _imageOpacity,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
