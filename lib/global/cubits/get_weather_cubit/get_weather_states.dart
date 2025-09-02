class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {}

class WeatherFailureState extends WeatherState {
  final String errMessage;

  WeatherFailureState({required this.errMessage});
}
