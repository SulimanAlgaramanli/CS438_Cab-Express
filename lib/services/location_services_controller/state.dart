import 'package:cab_express/services/location_services_controller/location_services.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationServicesControllerState {
  var locationService = LocationService(location: Location());
  final _permissionGranted = false.obs;
  final _serviceEnabled = false.obs;

  // final _location = const LocationModel().obs;
  //
  // LocationModel get location => _location.value;
  //
  // set location(LocationModel value) => _location.value = value;

  bool get permissionGranted => _permissionGranted.isTrue;

  set permissionGranted(bool value) {
    _permissionGranted.value = value;
  }

  bool get serviceEnabled => _serviceEnabled.isTrue;

  set serviceEnabled(bool value) {
    _serviceEnabled.value = value;
  }
}
