import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.image,
    required this.leadingText,
  });
  final String image;
  final String leadingText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image, width: 15, color: const Color(0xff978FA5)),
        const SizedBox(width: 5),
        Text(
          leadingText,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(179, 151, 143, 165),
          ),
        ),
      ],
    );
  }
}
