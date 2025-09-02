import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/Search/views/search_view.dart';
import 'package:weather_app/global/helper/helpers.dart';
import 'package:weather_app/global/helper/painters.dart';
import 'package:weather_app/bottom%20sheet/widgets/custom_button_icon.dart';

class AppBarBackgroundAndContent extends StatelessWidget {
  const AppBarBackgroundAndContent({super.key, required this.sheetProgress});
  final double sheetProgress;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: lerpDouble(1, 0, sheetProgress)!,
      child: SizedBox(
        height: 89,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipPath(
              clipper: BottomCliper(),
              child: Container(
                height: 88,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(58, 58, 106, 0.26),
                      Color.fromRGBO(37, 36, 76, 0.26),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.transparent, // hide default border
                    width: 1,
                  ),
                ),
              ),
            ),
            CustomPaint(painter: BottomClipBorderPainter()),
            Positioned(
              left: 45,
              bottom: 25,
              child: CustomButtonIcon(
                onTap: () async {
                  // open gps
                  showFindMyCityUsingGPSAlertDialog(context);
                },
                imageOrIcon: Image.asset("assets/images/gps.png", width: 25),
              ),
            ),
            Positioned(
              right: 45,
              bottom: 28,
              child: CustomButtonIcon(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchView()),
                  );
                },
                imageOrIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
