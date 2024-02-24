import 'package:cab_express/data/models/app/location.model.dart';
import 'package:cab_express/services/location_services_controller/location_services.dart';
import 'package:cab_express/services/location_services_controller/state.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationServiceController extends GetxService {
  static LocationServiceController get instance => Get.find();
  final state = LocationServicesControllerState();

  LocationService get _locationService => state.locationService;

  bool get allowed => permissionGranted && serviceEnabled;

  bool get permissionGranted => state.permissionGranted;

  set permissionGranted(bool value) => state.permissionGranted = value;

  bool get serviceEnabled => state.serviceEnabled;

  set serviceEnabled(bool value) => state.serviceEnabled = value;

  Future<void> checkPermissions() async {
    permissionGranted =
        (await _locationService.checkPermission()) == PermissionStatus.granted;
    serviceEnabled = await _locationService.isServiceEnabled();
  }

  Future<bool> requestPermissions() async {
    return await _locationService.requestPermission();
  }

  Future<bool> requestService() async {
    return await _locationService.requestService();
  }

  Future<LocationModel?> getLocation() async {
    return await _locationService.getLocationInfo();
  }
}
