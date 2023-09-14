import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSucsess extends WeatherState {
  
  WeatherModel weatherModel;
  
  WeatherSucsess({required this.weatherModel});
}

class WeatherFailure extends WeatherState {}
