import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Future<Position?> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        print('location not available');
        return Future.error('Location Not Available');
      }
    } else {
      print('Error');
      throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition();
  }
}