import 'package:cab_express/data/models/app/location.model.dart';
import 'package:cab_express/data/models/app/services_type.model.dart';

class TripModel {
  final int? id;
  final int? customerId;
  final int? driverId;
  final LocationModel? from;
  final LocationModel? to;
  final ServicesType? servicesType;
  final double? cost;
  final DateTime? timeTaken;
  final LocationModel? driverLocation;

  TripModel(
      {this.id,
      this.customerId,
      this.driverId,
      this.from,
      this.to,
      this.servicesType,
      this.cost,
      this.timeTaken,
      this.driverLocation});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TripModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          customerId == other.customerId &&
          driverId == other.driverId &&
          from == other.from &&
          to == other.to &&
          servicesType == other.servicesType &&
          cost == other.cost &&
          timeTaken == other.timeTaken &&
          driverLocation == other.driverLocation;

  @override
  int get hashCode =>
      id.hashCode ^
      customerId.hashCode ^
      driverId.hashCode ^
      from.hashCode ^
      to.hashCode ^
      servicesType.hashCode ^
      cost.hashCode ^
      timeTaken.hashCode ^
      driverLocation.hashCode;
}
