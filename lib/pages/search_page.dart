import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: TextField(
          onChanged: (data) {
            cityName = data;
          },
          onSubmitted: (data) {
            cityName = data;

            BlocProvider.of<WeatherCubit>(context).cityName = cityName;

            BlocProvider.of<WeatherCubit>(context)
                .getWeather(cityName: cityName!);

            Navigator.pop(context);
          },
          decoration: InputDecoration(
            label: const Text('Search'),
            suffixIcon: GestureDetector(
              child: const Icon(Icons.search),
              onTap: () async {
                BlocProvider.of<WeatherCubit>(context).cityName = cityName;

                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(cityName: cityName!);

                Navigator.pop(context);
              },
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 35, horizontal: 32),
            border: const OutlineInputBorder(),
            hintText: 'Enter a City',
          ),
        ),
      )),
    );
  }
}
