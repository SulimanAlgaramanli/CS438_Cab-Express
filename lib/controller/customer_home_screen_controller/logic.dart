import 'package:cab_express/data/models/app/location.model.dart';
import 'package:cab_express/services/location_services_controller/location_services.dart';
import 'package:cab_express/services/location_services_controller/logic.dart';
import 'package:cab_express/ui/flutter_map_widget/map_widget.dart';
import 'package:cab_express/utils/states.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'state.dart';

class CustomerHomeScreenControllerLogic extends GetxController {
  static CustomerHomeScreenControllerLogic get instance => Get.find();
  final state = CustomerHomeScreenControllerState();
  final locationService = LocationServiceController.instance;

  final locationStates = const States().obs;

  Future<void> onGetLocationPressed() async {
    if (locationStates.value.isLoading) return;
    locationStates.value = States.loading();
    await locationService.checkPermissions();
    if (!locationService.permissionGranted) {
      locationService.permissionGranted =
          await locationService.requestPermissions();
    }
    if (!locationService.serviceEnabled) {
      locationService.permissionGranted =
          await locationService.requestService();
    }
    if (locationService.allowed) {
      locationStates.value = States.success();
      state.yourLocation =
          await locationService.getLocation() ?? state.yourLocation;
      state.tecYourLocation.text = state.yourLocation.locationText;

      final newLatLong = state.yourLocation.toLatLng;
      if (newLatLong != null) {
        state.mapViewController.yourLocationMarker = Marker(
          point: newLatLong,
          child: MapViewController.placeIcon,
        );
        calculateDistanceBetween();
      }
      print(
        'CustomerHomeScreenControllerLogic.onGetLocationPressed:'
        ' location = ${state.yourLocation}',
      );
      return;
    }
    locationStates.value = States.error();
  }

  void calculateDistanceBetween() {
    state.distanceBetween.value =
        LocationService.calculateDistanceBetweenWithKm(
      startLatitude: state.yourLocation.lat,
      startLongitude: state.yourLocation.long,
      endLatitude: state.destinationLocation.lat,
      endLongitude: state.destinationLocation.long,
    );
  }

  @override
  void onInit() {
    print('CustomerHomeScreenControllerLogic.onInit');
    state.subscribeListener();
    super.onInit();
  }

  void onLongPressed(TapPosition tapPosition, LatLng point) {
    state.showBottomControlBar = true;
    state.mapViewController.onLongMapPressed(tapPosition, point);
    final location = LocationModel(long: point.longitude, lat: point.latitude);
    if (state.mapViewController.direction) {
      state.tecYourLocation.text = location.locationText;
      state.yourLocation = location;
      calculateDistanceBetween();
    } else {
      state.tecDestinationLocation.text = location.locationText;
      state.destinationLocation = location;
    }
  }

  void onDirectionPressed() async {
    state.mapViewController.direction = true;
   await onGetLocationPressed();
  }

  void cancelDirection() {
    state.distanceBetween.value = 0.0;
    state.showBottomControlBar = false;
    state.mapViewController.direction = false;
    state.yourLocation = const LocationModel();
    state.destinationLocation = const LocationModel();
    state.tecYourLocation.clear();
    state.tecDestinationLocation.clear();
    state.mapViewController.removeMarker();
  }

  @override
  void onClose() {
    state.cancelSubscribedListener();
    state.dispose();
    super.onClose();
  }
}
