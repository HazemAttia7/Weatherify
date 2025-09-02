
import 'package:flutter/material.dart';
import 'package:weather_app/Search/widgets/custom_back_button.dart';

class SearchViewHeader extends StatelessWidget {
  const SearchViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(left: 0, child: CustomBackButton()),
        Center(
          child: Text(
            "Search",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
