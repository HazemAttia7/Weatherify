import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Home%20Page/services/location_service.dart';
import 'package:weather_app/Home%20Page/widgets/app_background.dart';
import 'package:weather_app/Home%20Page/widgets/app_bar_background_and_content.dart';
import 'package:weather_app/Home%20Page/widgets/app_bar_painted_shape.dart';
import 'package:weather_app/bottom%20sheet/widgets/custom_draggable_scrollable_sheet.dart';
import 'package:weather_app/Home%20Page/widgets/custom_image_widget.dart';
import 'package:weather_app/Home%20Page/widgets/home_main_content.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/global/helper/helpers.dart';

// 1. Convert to a StatefulWidget
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  double _sheetProgress = 0.0;
  double _imageOpacity = 1.0;
  @override
  void initState() {
    super.initState();
    _loadCountry();
  }

  Future<void> _loadCountry() async {
    String? countryName = await LocationService().getCountryName();
    setState(() {
      defaultCountry = countryName;
    });
    if (mounted && countryName != null) {
      BlocProvider.of<GetWeatherCubit>(context).loadLocation(countryName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    const initialSheetSize = 0.377;
    const finalSheetSize = 0.85;

    return Scaffold(
      body: Stack(
        children: [
          AppBackground(screenWidth: screenWidth, screenHeight: screenHeight),
          CustomImage(
            sheetProgress: _sheetProgress,
            screenHeight: screenHeight,
            imageOpacity: _imageOpacity,
            image: "assets/images/background.png",
          ),
          Positioned(
            bottom: 100,
            child: CustomImage(
              sheetProgress: _sheetProgress,
              screenHeight: screenHeight,
              imageOpacity: _imageOpacity,
              image: "assets/images/house.png",
            ),
          ),
          HomeMainContent(
            sheetProgress: _sheetProgress,
            screenHeight: screenHeight,
            imageOpacity: _imageOpacity,
          ),

          NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              final progress =
                  (notification.extent - initialSheetSize) /
                  (finalSheetSize - initialSheetSize);
              setState(() {
                _sheetProgress = progress.clamp(0.0, 1.0);
                _imageOpacity = 1 - progress.clamp(0, 1);
              });
              return true;
            },
            child: CustomDraggableScrollableSheet(
              sheetProgress: _sheetProgress,
            ),
          ),
          Positioned(
            bottom: 0,
            left: -.5,
            right: 0,
            child: AppBarBackgroundAndContent(sheetProgress: _sheetProgress),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: IgnorePointer(
              child: AppBarPaintedShape(sheetProgress: _sheetProgress),
            ),
          ),
        ],
      ),
    );
  }
}
