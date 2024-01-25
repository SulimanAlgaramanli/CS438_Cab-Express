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
}