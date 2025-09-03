import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bottom%20sheet/models/weather_details_model.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/bottom%20sheet/widgets/air_quality_card.dart';
import 'package:weather_app/bottom%20sheet/widgets/sunrise_card_widget.dart';
import 'package:weather_app/bottom%20sheet/widgets/uv_index_card_widget.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        final cityName =
            context.read<GetWeatherCubit>().currentWeatherModel.cityName;

        return FutureBuilder<WeatherDetailsModel>(
          key: ValueKey(cityName),
          future: WeatherService().getWeatherDetails(cityName),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherDetailsModel weatherDetailsModel = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Column(
                  children: [
                    AirQualityCard(aqi: weatherDetailsModel.airQuality),
                    const SizedBox(height: 10),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          UVIndexCard(uvIndex: weatherDetailsModel.uvIndex),
                          const SizedBox(width: 10),
                          SunriseCard(
                            sunrise: weatherDetailsModel.sunrise,
                            sunset: weatherDetailsModel.sunset,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
