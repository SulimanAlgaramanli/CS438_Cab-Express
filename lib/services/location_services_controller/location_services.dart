import 'package:cab_express/data/models/app/location.model.dart';
import 'package:geolocator/geolocator.dart' as geoloc;
import 'package:location/location.dart';

class LocationService {
  final Location _location;

  const LocationService({required Location location}) : _location = location;

  static double calculateDistanceBetweenWithKm({
    double? startLatitude,
    double? startLongitude,
    double? endLatitude,
    double? endLongitude,
  }) {
    double distance = 0.0;
    if (
        startLatitude != null &&
        startLongitude != null &&
        endLatitude != null &&
        endLongitude != null
    ) {
      distance = geoloc.Geolocator.distanceBetween(
        startLatitude,
        startLongitude,
        endLatitude,
        endLongitude,
      );
    }
    print("Distance in meters: $distance");
    return distance / 1000.0;
  }

  Future<bool> requestPermission() async {
    PermissionStatus permission = await _location.requestPermission();
    return permission == PermissionStatus.granted;
  }

  Future<PermissionStatus> checkPermission() async {
    return await _location.hasPermission();
  }

  Future<bool> requestService() async {
    return await _location.requestService();
  }

  Future<bool> isServiceEnabled() async {
    return await _location.serviceEnabled();
  }

  Future<LocationData?> getLocation() async {
    LocationData? locationData;
    try {
      locationData = await _location.getLocation();
    } catch (e) {
      print("Error getting location: $e");
    }
    return locationData;
  }

  Stream<LocationData>? getLocationStream() {
    try {
      return _location.onLocationChanged;
    } catch (e) {
      print("Error getting location stream: $e");
      return null;
    }
  }

  Future<bool> changeSettings(
      {LocationAccuracy accuracy = LocationAccuracy.high,
        int interval = 1000,
        double distanceFilter = 0}) async {
    try {
      return await _location.changeSettings(
        accuracy: accuracy,
        interval: interval,
        distanceFilter: distanceFilter,
      );
    } catch (e) {
      print("Error changing settings: $e");
      return false;
    }
  }

  Future<LocationModel?> getLocationInfo() async {
    final locationData = await getLocation();
    if (locationData != null) {
      return LocationModel(
        long: locationData.longitude,
        lat: locationData.latitude,
      );
    }
    return null;
  }
}
