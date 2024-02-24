import 'package:get/get.dart';

import 'logic.dart';

class CustomerHomeScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CustomerHomeScreenControllerLogic());
  }

  const CustomerHomeScreenControllerBinding();
}
