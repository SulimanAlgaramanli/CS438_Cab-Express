import 'package:cab_express/utils/user_type.enum.dart';

abstract class BaseUserModel {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final UserType? userType;

  const BaseUserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.userType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseUserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          phoneNumber == other.phoneNumber &&
          userType == other.userType;

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      phoneNumber.hashCode ^
      userType.hashCode;
}

class UserModel extends BaseUserModel {
  const UserModel({
    super.id,
    super.email,
    super.firstName,
    super.lastName,
    super.phoneNumber,
    super.userType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is UserModel && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
