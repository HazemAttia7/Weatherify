import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bottom%20sheet/widgets/hourly_forecast_list_view.dart';
import 'package:weather_app/bottom%20sheet/widgets/weekly_forecast_list_view.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_states.dart';

class HourlyWeeklyForecastWidget extends StatelessWidget {
  const HourlyWeeklyForecastWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        } else if (state is WeatherLoadedState) {
          return Padding(
            padding: const EdgeInsets.only(left: 21, bottom: 15, right: 0),
            child: SizedBox(
              height: 166,
              child: PageView(
                physics:
                    const NeverScrollableScrollPhysics(), // Disables scrolling
                controller: pageController,
                children: const [
                  HourlyForecastListView(),
                  WeeklyForecastListView(),
                ],
              ),
            ),
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
    );
  }
}
