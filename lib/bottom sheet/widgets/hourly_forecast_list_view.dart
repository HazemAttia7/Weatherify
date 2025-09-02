import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bottom%20sheet/models/hourly_forecast_model.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/bottom%20sheet/widgets/weather_widget.dart';

class HourlyForecastListView extends StatelessWidget {
  const HourlyForecastListView({super.key});
  bool _isNow(DateTime date1, DateTime date2) {
    return date1.hour == date2.hour;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        String cityName =
            BlocProvider.of<GetWeatherCubit>(
              context,
            ).currentWeatherModel.cityName;
        return FutureBuilder<List<HourlyForecastModel>>(
          future: WeatherService().getHourlyForecast(cityName),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<HourlyForecastModel> hourlyForecastList = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hourlyForecastList.length,
                itemBuilder: (context, index) {
                  HourlyForecastModel hourlyForecastModel =
                      hourlyForecastList[index];
                  return WeatherDettailsWidget(
                    date: getHourIn12Format(hourlyForecastModel.date),
                    conditionImage: hourlyForecastModel.conditionImage,
                    chanceOfRain: hourlyForecastModel.chanceOfRain,
                    temp: hourlyForecastModel.temp,
                    isNow: _isNow(hourlyForecastModel.date, DateTime.now()),
                  );
                },
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

String getHourIn12Format(DateTime time) {
  int hour = time.hour;
  String period = (hour < 12) ? 'AM' : 'PM';
  if (hour > 12) {
    hour = hour - 12;
  }
  if (hour == 0) {
    hour = 12;
  }
  return "$hour $period";
}
