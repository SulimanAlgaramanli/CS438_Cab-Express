class LocationModel{
  final int? id;
  final double? long;
  final double? lat;

  const LocationModel({
    this.id,
    this.long,
    this.lat,
  });

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
      'id': this.id,
      'long': this.long,
      'lat': this.lat,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      id: map['id'] as int,
      long: map['long'] as double,
      lat: map['lat'] as double,
    );
  }
}