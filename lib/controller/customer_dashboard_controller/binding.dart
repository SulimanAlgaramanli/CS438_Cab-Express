import 'package:get/get.dart';

import 'logic.dart';

class CustomerDashboardControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerDashboardControllerLogic());
  }

  const CustomerDashboardControllerBinding();
}
