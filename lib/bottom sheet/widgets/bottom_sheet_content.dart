import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "dart:ui";
import 'package:weather_app/bottom%20sheet/widgets/forecast_header_widget.dart';
import 'package:weather_app/bottom%20sheet/widgets/hourly_weekly_forecast_widget.dart';
import 'package:weather_app/bottom%20sheet/widgets/little_grabber_handle_widget.dart';
import 'package:weather_app/bottom%20sheet/widgets/weather_details_widget.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_states.dart';

class BottomSheetContent extends StatelessWidget {
  BottomSheetContent({
    super.key,
    required this.scrollController,
    required this.sheetProgress,
  });
  final double sheetProgress;
  final ScrollController scrollController;
  final progress = 0.2; // (aqi / 500.0).clamp(0.0, 1.0);
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 8),
      controller: scrollController,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: LittleGrabberHandle(),
            ),
            const SizedBox(height: 10),
            ForecastHeader(pageController: pageController),
            const Divider(color: Colors.white38, thickness: 1),
            BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoadedState) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Column(
                      children: [
                        HourlyWeeklyForecastWidget(
                          pageController: pageController,
                        ),
                        SizedBox(height: lerpDouble(75, 10, sheetProgress)),
                        const Text(
                          "Weather Details",
                          style: TextStyle(color: Colors.white, fontSize: 38),
                        ),
                        const SizedBox(height: 20),
                        const WeatherDetailsWidget(),
                      ],
                    ),
                  );
                } else if (state is WeatherLoadingState) {
                  return const Padding(
                    padding:  EdgeInsets.only(top :24),
                    child:  CircularProgressIndicator(color: Colors.white),
                  );
                } else {
                  return const Center(
                    child: Text(
                      "Oops! There was an error .",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
