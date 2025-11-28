import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<String?> getCountryName() async {
    try {
      var status = await Permission.location.request();

      if (status.isGranted) {
        // Use low accuracy for faster results and add timeout
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.low,
          ),
        ).timeout(const Duration(seconds: 8));

        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        ).timeout(const Duration(seconds: 5));

        if (placemarks.isNotEmpty) {
          return placemarks.first.country;
        }
      } else if (status.isPermanentlyDenied) {
        await openAppSettings();
      }

      return null;
    } catch (e) {
      log(e.toString());
      // Return null if anything fails (timeout, network, etc.)
      return null;
    }
  }
}
