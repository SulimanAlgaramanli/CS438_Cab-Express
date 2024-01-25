import 'package:cab_express/data/models/core/user.model.dart';
import 'package:cab_express/utils/equality.util.dart';

class CustomerModel extends UserModel {

  const CustomerModel({
    super.id,
    super.email,
    super.firstName,
    super.lastName,
    super.phoneNumber,
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
          phoneNumber == other.phoneNumber ;
  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      phoneNumber.hashCode;
}
