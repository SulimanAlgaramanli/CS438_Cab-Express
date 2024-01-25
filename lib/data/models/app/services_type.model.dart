import 'package:cab_express/utils/gender.enum.dart';

class ServicesType {
  final int? id;
  final int? numberOfPassengers;
  final Gender? gender;
  final bool? isSharedTrip;

  ServicesType({this.id, this.numberOfPassengers, this.gender, this.isSharedTrip});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServicesType &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          numberOfPassengers == other.numberOfPassengers &&
          gender == other.gender &&
          isSharedTrip == other.isSharedTrip;

  @override
  int get hashCode =>
      id.hashCode ^
      numberOfPassengers.hashCode ^
      gender.hashCode ^
      isSharedTrip.hashCode;
}