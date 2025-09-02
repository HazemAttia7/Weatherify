import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Home%20Page/widgets/home_view_body.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_cubit.dart';

class HomeMainContent extends StatelessWidget {
  const HomeMainContent({
    super.key,
    required double sheetProgress,
    required this.screenHeight,
    required double imageOpacity,
  }) : _sheetProgress = sheetProgress,
       _imageOpacity = imageOpacity;

  final double _sheetProgress;
  final double screenHeight;
  final double _imageOpacity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return HomeViewBody(
            sheetProgress: _sheetProgress,
            currentWeatherModel:
                BlocProvider.of<GetWeatherCubit>(context).currentWeatherModel,
            screenHeight: screenHeight,
            imageOpacity: _imageOpacity,
          );
        } else if (state is WeatherLoadingState) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 350),
            child: Center(
              child: CircularProgressIndicator(color: Colors.white),
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
