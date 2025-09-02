import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff2E335A),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        hintText: "Search for a country or airport",
        hintStyle: const TextStyle(color: Color(0xffA1A1BA), fontSize: 17),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(Icons.search, color: Color(0xffA1A1BA)),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white12, width: 2),
    borderRadius: BorderRadius.circular(10),
  );
}
