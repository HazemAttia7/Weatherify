import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bottom%20sheet/models/weekly_forecast_model.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/bottom%20sheet/widgets/weather_widget.dart';

class WeeklyForecastListView extends StatelessWidget {
  const WeeklyForecastListView({super.key});
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        String cityName =
            BlocProvider.of<GetWeatherCubit>(
              context,
            ).currentWeatherModel.cityName;
        return FutureBuilder<List<WeeklyForecastModel>>(
          future: WeatherService().getWeeklyForecast(cityName),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<WeeklyForecastModel> weeklyForecastList = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weeklyForecastList.length,
                itemBuilder: (context, index) {
                  WeeklyForecastModel weeklyForecastModel =
                      weeklyForecastList[index];
                  return WeatherDettailsWidget(
                    date: getDayName(weeklyForecastModel.date),
                    conditionImage: weeklyForecastModel.conditionImage,
                    chanceOfRain: weeklyForecastModel.chanceOfRain,
                    temp: weeklyForecastModel.temp,
                    isNow: _isSameDay(weeklyForecastModel.date, DateTime.now()),
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

String getDayName(DateTime date) {
  // A list of day names. The DateTime.weekday property returns a
  // number from 1 (Monday) to 7 (Sunday).
  const List<String> dayNames = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  // We subtract 1 from the weekday number to get the correct index (0-6).
  return dayNames[date.weekday - 1];
}
