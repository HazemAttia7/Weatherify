// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:weather_app/Home%20Page/models/current_weather_model.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/services/weather_service.dart';

part 'get_weather_cubit_state.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  late CurrentWeatherModel currentWeatherModel;

  void setWeather(CurrentWeatherModel model) {
    if (model.cityName.isNotEmpty) {
      currentWeatherModel = model;
      emit(WeatherLoadedState());
    } else {
      emit(
        WeatherFailureState(
          errMessage: "Oops! There was an error loading the weather details .",
        ),
      );
    }
  }

  void loadLocation(String cityName) async {
    emit(WeatherLoadingState());
    CurrentWeatherModel currentWeatherModel = await WeatherService()
        .getCurrentWeather(cityName);
    currentWeatherModel.cityName = cityName;
    setWeather(currentWeatherModel);
  }
}
