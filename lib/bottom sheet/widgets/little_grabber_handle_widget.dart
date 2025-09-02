import 'package:flutter/material.dart';

class LittleGrabberHandle extends StatelessWidget {
  const LittleGrabberHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(135, 31, 29, 71),
      ),
    );
  }
}
