import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapViewController extends ChangeNotifier {
  MapViewController() {
    notifyListeners();
  }

  void removeMarker() {
    _yourLocationMarker =
        Marker(point: initialPosition, child: const SizedBox.shrink());
    _destLocationMarker =
        Marker(point: initialPosition, child: const SizedBox.shrink());
  }

  bool _direction = false;

  bool get direction => _direction;

  set direction(bool value) {
    _direction = value;
    notifyListeners();
  }

  static const _initialPosition = LatLng(
    32.8872,
    13.1913,
  );
  static const placeIcon = Icon(
    Icons.place,
    size: 35.0,
    color: Colors.redAccent,
  );
  final mapController = MapController();

  LatLng get initialPosition => _initialPosition;
  static const _initialZoom = 13.0;

  double get initialZoom => _initialZoom;
  var _yourLocationMarker = const Marker(
    point: _initialPosition,
    child: SizedBox.shrink(),
  );

  Marker get yourLocationMarker => _yourLocationMarker;

  set yourLocationMarker(Marker value) {
    _yourLocationMarker = value;
    mapController.move(value.point, 13.0);
    notifyListeners();
  }

  var _destLocationMarker = const Marker(
    point: _initialPosition,
    child: SizedBox.shrink(),
  );

  Marker get destLocationMarker => _destLocationMarker;

  set destLocationMarker(Marker value) {
    _destLocationMarker = value;
    mapController.move(value.point, 13.0);
    notifyListeners();
  }

  onDestinationFieldFocused(Marker value) {
    mapController.move(value.point, 14.0);
  }

  onLongMapPressed(TapPosition tapPosition, LatLng point) {
    if (direction) {
      yourLocationMarker = Marker(point: point, child: placeIcon);
    } else {
      destLocationMarker = Marker(point: point, child: placeIcon);
    }
  }
}

class MapView extends StatelessWidget {
  const MapView({super.key, required this.controller, this.onLongMapPressed});

  final MapViewController controller;
  final void Function(TapPosition tp, LatLng ll)? onLongMapPressed;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, widget) {
          return FlutterMap(
            options: MapOptions(
              initialCenter: controller.initialPosition,
              initialZoom: controller.initialZoom,
              onLongPress: onLongMapPressed,
            ),
            mapController: controller.mapController,
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(markers: [
                controller.yourLocationMarker,
                controller.destLocationMarker
              ])
            ],
          );
        });
  }
}
