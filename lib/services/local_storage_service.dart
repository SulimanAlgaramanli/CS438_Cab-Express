import 'package:cab_express/data/models/core/customer.model.dart';
import 'package:cab_express/data/models/core/driver.model.dart';
import 'package:cab_express/utils/user_type.enum.dart';
import 'package:get/get.dart';

class LocalStorageService extends GetxService {
  static LocalStorageService get instance => Get.find();

  String? get userId {
    return switch (userType) {
      UserType.customer => customer.id,
      UserType.driver => driver.id,
    };
  }

  final _userType = UserType.customer.obs;

  UserType get userType => _userType.value;
  final _customer = const CustomerModel().obs;

  CustomerModel get customer => _customer.value;

  set customer(CustomerModel value) {
    _userType.value = value.userType ?? _userType.value;
    _customer.value = value;
  }

  final _driver = const DriverModel().obs;

  DriverModel get driver => _driver.value;

  set driver(DriverModel value) {
    _userType.value = value.userType ?? _userType.value;
    _driver.value = value;
  }

  Future<void> init() async {}

  void removeCustomer() {
    _customer.value = const CustomerModel();
  }

  void removeDriver() {
    _driver.value = const DriverModel();
  }
}
