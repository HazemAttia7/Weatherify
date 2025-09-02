import 'package:flutter/material.dart';
import 'package:weather_app/Home%20Page/views/home_view.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const ModernWeatherApp());
}

class ModernWeatherApp extends StatefulWidget {
  const ModernWeatherApp({super.key});

  @override
  State<ModernWeatherApp> createState() => _ModernWeatherAppState();
}

class _ModernWeatherAppState extends State<ModernWeatherApp> {
  @override
  void initState() {
    super.initState();
    // _loadCountry();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: "SF Pro"),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
