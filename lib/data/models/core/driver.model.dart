import 'package:cab_express/data/models/app/car.model.dart';
import 'package:cab_express/data/models/core/user.model.dart';
import 'package:flutter/foundation.dart';

class DriverModel extends UserModel {
  final List<CarModel>? cars;

  const DriverModel({
    super.id,
    super.email,
    super.firstName,
    super.lastName,
    super.phoneNumber,
    super.userType,
    this.cars,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          phoneNumber == other.phoneNumber &&
          userType == other.userType &&
          listEquals(cars, other.cars);

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      phoneNumber.hashCode ^
      userType.hashCode ^
      cars.hashCode;

//
}
