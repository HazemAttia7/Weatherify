import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.progress});

  final double progress; // (aqi / 500.0).clamp(0.0, 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8, // Increased height to accommodate the dot
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Progress gradient - centered vertically
          Positioned(
            top: 2,
            left: 0,
            right: 0,
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4A90E2), Color(0xFFE91E63)],
                  stops: [0.0, 1.0],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Progress indicator (white dot)
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Align(
              alignment: Alignment(
                (progress * 2) - 1, // Convert 0-1 to -1 to 1 for alignment
                0,
              ),
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
