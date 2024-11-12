import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case 'sunny':
    case 'clear':
      return Colors.orange;

    case 'partly cloudy':
      return Colors.blueGrey;

    case 'cloudy':
    case 'overcast':
      return Colors.grey;

    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.lightBlue;

    case 'patchy rain possible':
    case 'light rain':
    case 'patchy light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.lightGreen;

    case 'patchy snow possible':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'blowing snow':
    case 'blizzard':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors
          .blueGrey; // Using blueGrey as there is no pure white MaterialColor

    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
    case 'patchy freezing drizzle possible':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.cyan;

    case 'thundery outbreaks possible':
      return Colors.deepPurple;

    case 'patchy light drizzle':
    case 'light drizzle':
      return Colors.lightGreen;

    default:
      return Colors.blue;
  }
}
