import 'package:cab_express/utils/user_type.enum.dart';

abstract class UserModel {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final UserType? userType;

  const UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.userType,
  });



}
