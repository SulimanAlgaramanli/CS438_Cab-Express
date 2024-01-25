import 'package:get/get.dart';

import 'logic.dart';

class DashboardControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardControllerLogic());
  }

  const DashboardControllerBinding();
}
