import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<String?> getCountryName() async {
    var status = await Permission.location.request();

    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // Convert coordinates to address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        return placemarks.first.country; // Country name
      }
    } else if (status.isDenied) {
      // Permission denied once
      return null;
    } else if (status.isPermanentlyDenied) {
      // User denied forever → open app settings
      await openAppSettings();
      return null;
    }

    return null;
  }
}
