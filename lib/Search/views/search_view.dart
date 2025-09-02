import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Home%20Page/models/current_weather_model.dart';
import 'package:weather_app/Search/widgets/custom_search_textfield.dart';
import 'package:weather_app/Search/widgets/custom_weather_card.dart';
import 'package:weather_app/Search/widgets/search_view_header.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late Future<List<CurrentWeatherModel>> _initGetWeatherForAllCountries;
  @override
  void initState() {
    super.initState();
    _initGetWeatherForAllCountries =
        WeatherService().getWeatherForAllCountries();
  }

  String cityToSearch = "";
  List<CurrentWeatherModel> weatherList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.95, -0.31), // 168.44 degrees
            end: Alignment(0.95, 0.31),
            stops: [0.0162, 0.9572], // 1.62% and 95.72%
            colors: [
              Color(0xFF2E335A), // #2E335A
              Color(0xFF1C1B33), // #1C1B33
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const SearchViewHeader(),
              const SizedBox(height: 20),
              CustomSearchTextField(
                onChanged: (data) {
                  setState(() {
                    cityToSearch = data;
                  });
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<CurrentWeatherModel>>(
                  future: _initGetWeatherForAllCountries,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                    if (snapshot.hasData) {
                      weatherList =
                          cityToSearch.isNotEmpty
                              ? snapshot.data!
                                  .where(
                                    (weather) => weather.cityName
                                        .toLowerCase()
                                        .contains(cityToSearch.toLowerCase()),
                                  )
                                  .toList()
                              : snapshot.data!;
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 40),
                        itemCount: weatherList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: index != 9 ? 60 : 40,
                            ),
                            child: CustomWeatherCard(
                              currentWeatherModel: weatherList[index],
                              onTap: () {
                                BlocProvider.of<GetWeatherCubit>(
                                  context,
                                ).setWeather(weatherList[index]);

                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: Text(
                        "Oops! Something went wrong",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
