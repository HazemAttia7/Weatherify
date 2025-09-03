import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Home%20Page/services/location_service.dart';
import 'package:weather_app/global/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/global/helper/helpers.dart';
import 'package:weather_app/global/widgets/custom_button.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({super.key});

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            const Text(
              "Do you want to find your city using GPS?",
              style: TextStyle(color: Colors.black, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Yes',
                    textColor: Colors.white,
                    backColor: const Color.fromARGB(255, 93, 66, 146),
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      String? countryName =
                          await LocationService().getCountryName();
                      defaultCountry = countryName;
                      setState(() {
                        isLoading = false;
                      });
                      if (countryName != null) {
                        BlocProvider.of<GetWeatherCubit>(
                          context,
                        ).loadLocation(countryName);
                        Navigator.pop(context);
                      }
                    },
                    isLoading: isLoading,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: 'No',
                    textColor: Colors.black45,
                    backColor: const Color.fromARGB(255, 213, 192, 253),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
