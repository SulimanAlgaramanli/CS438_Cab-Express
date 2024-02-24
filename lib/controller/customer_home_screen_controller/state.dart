import 'package:cab_express/data/models/app/location.model.dart';
import 'package:cab_express/ui/flutter_map_widget/map_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomerHomeScreenControllerState {
  final _yourLocation = const LocationModel().obs;
  final _destinationLocation = const LocationModel().obs;
  final mapViewController = MapViewController();
  final _showBottomControlBar = false.obs;
  final distanceBetween = 0.0.obs;

  bool get showBottomControlBar => _showBottomControlBar.isTrue;

  set showBottomControlBar(bool value) => _showBottomControlBar.value = value;

  LocationModel get yourLocation => _yourLocation.value;

  set yourLocation(LocationModel value) => _yourLocation.value = value;

  LocationModel get destinationLocation => _destinationLocation.value;

  set destinationLocation(LocationModel value) =>
      _destinationLocation.value = value;

  final tecYourLocation = TextEditingController();
  final tecDestinationLocation = TextEditingController();
  final _hideYourDestinationCorrectIcon = true.obs;
  final _hideYourLocationCorrectIcon = true.obs;
  final _readOnlyTecYourLocation = false.obs;
  final _readOnlyTecYourDestination = false.obs;

  bool get hideYourLocationCorrectIcon => _hideYourLocationCorrectIcon.isTrue;

  set hideYourLocationCorrectIcon(bool value) =>
      _hideYourLocationCorrectIcon.value = value;

  bool get hideYourDestinationCorrectIcon =>
      _hideYourDestinationCorrectIcon.isTrue;

  set hideYourDestinationCorrectIcon(bool value) =>
      _hideYourDestinationCorrectIcon.value = value;

  bool get readOnlyTecYourLocation => _readOnlyTecYourLocation.isTrue;

  set readOnlyTecYourLocation(bool value) =>
      _readOnlyTecYourLocation.value = value;

  bool get readOnlyTecYourDestination => _readOnlyTecYourDestination.isTrue;

  set readOnlyTecYourDestination(bool value) =>
      _readOnlyTecYourDestination.value = value;

  void subscribeListener() {
    tecYourLocation.addListener(onYourLocationTextChanged);
    tecDestinationLocation.addListener(onDestinationLocationTextChanged);
  }

  void cancelSubscribedListener() {
    tecYourLocation.removeListener(onYourLocationTextChanged);
    tecDestinationLocation.removeListener(onDestinationLocationTextChanged);
  }

  dispose() {
    tecYourLocation.dispose();
    tecDestinationLocation.dispose();
  }

  void onYourLocationTextChanged() {
    final value = tecYourLocation.text.trim();
    print('CustomerHomeScreenControllerState.onYourLocationTextChanged');
    if (value.isEmpty) {
      hideYourLocationCorrectIcon = true;
    } else {
      hideYourLocationCorrectIcon = false;
    }
  }

  void onDestinationLocationTextChanged() {
    final value = tecDestinationLocation.text.trim();
    print('CustomerHomeScreenControllerState.onDestinationLocationTextChanged');
    if (value.isEmpty) {
      hideYourDestinationCorrectIcon = true;
    } else {
      hideYourDestinationCorrectIcon = false;
    }
  }
}
