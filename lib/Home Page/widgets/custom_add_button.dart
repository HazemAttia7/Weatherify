import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 58,
        height: 58,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add, size: 44, color: Color(0xff48319D)),
      ),
    );
  }
}
