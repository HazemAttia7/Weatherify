import 'package:flutter/material.dart';

class ForecastText extends StatelessWidget {
  const ForecastText({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
