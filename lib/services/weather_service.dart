import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:weather_app/global/helper/helpers.dart';
import 'package:weather_app/Home%20Page/models/current_weather_model.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/bottom%20sheet/models/hourly_forecast_model.dart';
import 'package:weather_app/bottom%20sheet/models/weather_details_model.dart';
import 'package:weather_app/bottom%20sheet/models/weekly_forecast_model.dart';

class WeatherService {
  final dio = Dio(
    BaseOptions(
      followRedirects: true,
      maxRedirects: 5,
      validateStatus: (status) {
        // Accept 2xx and 3xx as valid
        return status != null && status < 400;
      },
    ),
  );
  WeatherService();

  Future<Map<String, dynamic>> _fetchData(
    String cityName, [
    int daysNum = 1,
  ]) async {
    Response response = await dio.get(
      "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=$daysNum&aqi=yes",
    );
    try {
      return response.data;
    } on DioException catch (e) {
      String errMessage =
          e.response?.data["error"]["message"] ??
          "oops there was en error , try again later";
      throw Exception(errMessage);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("oops there was en error , try again later");
    }
  }

  Future<Map<String, dynamic>> _fetchWeatherDetails(
    String cityName,
    DateTime date,
  ) async {
    Response response = await dio.get(
      "$baseUrl/astronomy.json?key=$apiKey&q=$cityName&dt=$date",
    );
    try {
      return response.data;
    } on DioException catch (e) {
      String errMessage =
          e.response?.data["error"]["message"] ??
          "oops there was en error , try again later";
      throw Exception(errMessage);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("oops there was en error , try again later");
    }
  }

  Future<CurrentWeatherModel> getCurrentWeather(String cityName) async {
    Map<String, dynamic> data = await _fetchData(cityName);
    CurrentWeatherModel currentWeatherModel = CurrentWeatherModel.fromJSON(
      data,
    );
    return currentWeatherModel;
  }

  Future<List<HourlyForecastModel>> getHourlyForecast(String cityName) async {
    Map<String, dynamic> data = await _fetchData(cityName);
    List<HourlyForecastModel> hourlyForecastList = [];
    for (var i = 0; i < 24; i++) {
      hourlyForecastList.add(HourlyForecastModel.fromJSON(data, i));
    }
    return hourlyForecastList;
  }

  Future<List<WeeklyForecastModel>> getWeeklyForecast(String cityName) async {
    Map<String, dynamic> data = await _fetchData(cityName, 7);
    List<WeeklyForecastModel> weeklyForecastList = [];
    for (
      var i = 0;
      i < min(7, (data["forecast"]["forecastday"] as List).length);
      i++
    ) {
      weeklyForecastList.add(WeeklyForecastModel.fromJSON(data, i));
    }
    return weeklyForecastList;
  }

  Future<WeatherDetailsModel> getWeatherDetails(String cityName) async {
    Map<String, dynamic> data1 = await _fetchData(cityName);
    Map<String, dynamic> data2 = await _fetchWeatherDetails(
      cityName,
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
    );
    WeatherDetailsModel weatherDetailsModel = WeatherDetailsModel.fromJSON(
      data1,
      data2,
    );
    return weatherDetailsModel;
  }

  static const String _countriesUrl =
      'https://countriesnow.space/api/v0.1/countries/capital';

  // Step 1: Get all countries with their capitals
  Future<Map<String, String>> getAllCountries() async {
    try {
      final response = await dio.get(_countriesUrl);
      final Map<String, dynamic> responseMap = response.data;
      final List<dynamic> countries = responseMap["data"];

      // Build a single map { "Egypt": "Cairo", "France": "Paris", ... }
      final Map<String, String> countriesMap = {
        for (var country in countries)
          if (country['capital'] != null &&
              country['capital'].toString().isNotEmpty)
            country['name'].toString(): country['capital'].toString(),
      };

      return countriesMap;
    } catch (e) {
      throw Exception('Failed to load countries: $e');
    }
  }

  // Step 2: Get weather for all countries (using capitals)
  Future<List<CurrentWeatherModel>> getWeatherForAllCountries() async {
    try {
      final countries = await getAllCountries();

      final futures =
          countries.entries.map((entry) async {
            final countryName = entry.key;
            final capital = entry.value;

            try {
              final weather = await getCurrentWeather(capital);
              weather.capital = capital; // attach city name
              return weather;
            } catch (e) {
              debugPrint('Failed for $countryName ($capital): $e');
              return null;
            }
          }).toList();

      final results = await Future.wait(futures);
      return results.whereType<CurrentWeatherModel>().toList();
    } catch (e) {
      throw Exception('Failed to load weather for all countries: $e');
    }
  }
}
