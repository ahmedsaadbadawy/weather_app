import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '5200e92814f64c75bec154928230107';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromJson(data);

      // var jsonData = data['forecast']['forecastday'][0]['day'];

      // WeatherModel weather = WeatherModel(
      //   date: data['location']['localtime'],
      //   temp: jsonData['avgtemp_c'],
      //   maxTemp: jsonData['maxtemp_c'],
      //   minTemp: jsonData['mintemp_c'],
      //   weatherStateName: jsonData['condition']['text'],
      // );
    } catch (e) {
      print(e);
    }

    return weather;
  }
}
