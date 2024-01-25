class RateModel{
  final int? id;
  final int? tripId;
  final double? value;

  const RateModel({
    this.id,
    this.tripId,
    this.value,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RateModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          tripId == other.tripId &&
          value == other.value;

  @override
  int get hashCode => id.hashCode ^ tripId.hashCode ^ value.hashCode;
}