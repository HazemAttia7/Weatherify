import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios,
        size: 30,
        color: Color(0xffA1A1BA),
      ),
    );
  }
}
