import 'package:cab_express/data/models/core/user.model.dart';

class UserAuthModel extends BaseUserModel {
  final String? password;

  const UserAuthModel({
    super.id,
    super.email,
    super.firstName,
    super.lastName,
    super.phoneNumber,
    this.password,
  });

  const UserAuthModel.signup({
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? password,
  }) : this(
          email: email,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          password: password,
        );

  const UserAuthModel.login({
    String? email,
    String? password,
  }) : this(
          email: email,
          password: password,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAuthModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          phoneNumber == other.phoneNumber &&
          userType == other.userType &&
          password == other.password;

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      phoneNumber.hashCode ^
      userType.hashCode ^
      password.hashCode;

  UserAuthModel copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) {
    return UserAuthModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toNewUserJson() {
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "userType": 0,
    };
  }
}
