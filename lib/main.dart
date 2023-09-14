import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/services/weather_service.dart';
import './cubits/weather_cubit/weather_cubit.dart';

import 'pages/myhome_page.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch:
                BlocProvider.of<WeatherCubit>(context).weatherModel == null
                    ? Colors.blue
                    : BlocProvider.of<WeatherCubit>(context)
                        .weatherModel!
                        .getThemeColor(),
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}
