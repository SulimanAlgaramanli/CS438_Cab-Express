import 'package:cab_express/data/models/app/car.model.dart';
import 'package:cab_express/data/models/core/user.model.dart';
import 'package:cab_express/utils/user_type.enum.dart';
import 'package:flutter/foundation.dart';

class DriverModel extends BaseUserModel {
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

  Map<String, dynamic> toMap() {
    return {
      'cars': cars,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic>? map, String? id) {
    return DriverModel(
      id: id,
      email: map?['email'],
      firstName: map?['firstName'],
      lastName: map?['lastName'],
      phoneNumber: map?['phoneNumber'],
      userType: UserType.values[map?['userType'] ?? 0],
      cars: List.of(map?['cars']).map((e) => CarModel.fromMap(e)).toList(),
    );
  }
//
}
