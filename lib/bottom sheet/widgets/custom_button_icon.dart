import 'package:flutter/material.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({super.key, this.onTap, required this.imageOrIcon});
  final void Function()? onTap;
  final Widget imageOrIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: imageOrIcon,
    );
  }
}
