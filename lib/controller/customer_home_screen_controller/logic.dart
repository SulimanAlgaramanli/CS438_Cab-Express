import 'package:cab_express/data/models/app/location.model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'state.dart';

class CustomerHomeScreenControllerLogic extends GetxController {
  static CustomerHomeScreenControllerLogic get instance => Get.find();
  final state = CustomerHomeScreenControllerState();

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
    } else {
      state.tecDestinationLocation.text = location.locationText;
      state.destinationLocation = location;
    }
  }

  void onDirectionPressed() async {
    state.mapViewController.direction = true;
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
