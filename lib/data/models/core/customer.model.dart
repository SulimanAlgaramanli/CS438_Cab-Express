import 'package:cab_express/data/models/app/location.model.dart';
import 'package:cab_express/data/models/core/user.model.dart';
import 'package:flutter/foundation.dart';

class CustomerModel extends UserModel {
  final List<LocationModel>? locations;

  const CustomerModel({
    super.id,
    super.email,
    super.firstName,
    super.lastName,
    super.phoneNumber,
    super.userType,
    this.locations,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          phoneNumber == other.phoneNumber &&
          userType == other.userType &&
          listEquals(locations, other.locations);

          
  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      phoneNumber.hashCode ^
      userType.hashCode ^
      locations.hashCode;
}
