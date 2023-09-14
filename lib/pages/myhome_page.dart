import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import '../widgets/DefaulBody.dart';
import '../widgets/success_body.dart';
import 'search_page.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text("Weather App"),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherSucsess) {
            // Cause the (state) Is Object of WeatherSucsess.
            return SuccessBody(weatherData: state.weatherModel);
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text('Somthing went wrong please try again'),
            );
          } else {
            return const DefaulBody();
          }
        },
      ),
    );
  }
}
