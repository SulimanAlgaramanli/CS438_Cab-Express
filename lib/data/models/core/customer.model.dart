import 'package:cab_express/data/models/app/location.model.dart';
import 'package:cab_express/data/models/core/user.model.dart';
import 'package:cab_express/utils/user_type.enum.dart';
import 'package:flutter/foundation.dart';

class CustomerModel extends BaseUserModel {
  final List<LocationModel>? locations;

  String? get fullName =>
      firstName != null && lastName != null ? '$firstName $lastName' : null;

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

  factory CustomerModel.fromMap(Map<String, dynamic>? map, String? id) {
    return CustomerModel(
      locations: List.of(map?['locations'] ?? [])
          .map((e) => LocationModel.fromMap(e))
          .toList(),
      id: id,
      email: map?['email'] as String,
      firstName: map?['firstName'] as String,
      lastName: map?['lastName'] as String,
      phoneNumber: map?['phoneNumber'] as String,
      userType: UserType.values[map?['userType'] ?? 0],
    );
  }
}
