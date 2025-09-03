import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backColor,
    required this.onTap,
    this.isLoading = false,
  });
  final String text;
  final Color textColor;
  final Color backColor;
  final VoidCallback onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child:
              isLoading
                  ? const SizedBox(
                    width: 20, // Set custom width
                    height: 20, // Set custom height
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.0, // Make stroke thinner too
                    ),
                  )
                  : Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        ),
      ),
    );
  }
}
