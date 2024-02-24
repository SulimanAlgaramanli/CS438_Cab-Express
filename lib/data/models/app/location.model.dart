import 'package:latlong2/latlong.dart';

class LocationModel {
  final int? id;
  final double? long;
  final double? lat;

  const LocationModel({
    this.id,
    this.long,
    this.lat,
  });

  LatLng? get toLatLng {
    final lat = this.lat;
    final long = this.long;
    if (long != null && lat != null) {
      return LatLng(lat, long);
    }
    print('LocationModel.toLatLng: unknown coordinates location.');
    return null;
  }

  String get locationText => long != null && lat != null ? '$long/$lat' : '';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          long == other.long &&
          lat == other.lat;

  @override
  int get hashCode => id.hashCode ^ long.hashCode ^ lat.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'long': long,
      'lat': lat,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic>? map) {
    return LocationModel(
      id: map?['id'],
      long: map?['long'],
      lat: map?['lat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "long": long,
      "lat": lat,
    };
  }

  @override
  String toString() {
    return 'LocationModel{id: $id, long: $long, lat: $lat}';
  }
}
