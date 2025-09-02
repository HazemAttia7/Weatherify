import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.widget, required this.width});
  final Widget widget;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(160, 36, 16, 82),
        border: Border.all(color: const Color(0xff653CAB), width: 1),
      ),
      child: Padding(padding: const EdgeInsets.all(20), child: widget),
    );
  }
}
